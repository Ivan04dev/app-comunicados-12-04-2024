import { useState, useEffect } from 'react';
import axios from 'axios';

function App() {
    const [ciudades, setCiudades] = useState({});
    const [ciudadesSeleccionadas, setCiudadesSeleccionadas] = useState([]);
    const [marcaSeleccionada, setMarcaSeleccionada] = useState('Nacional');

    useEffect(() => {
        handleChangeMarca({ target: { value: marcaSeleccionada } });
    }, []);

    const handleChangeMarca = async (event) => {
        const value = event.target.value;
        setMarcaSeleccionada(value);
        try {
            let response;
            if (value === 'Nacional') {
                response = await axios.get('http://localhost:3000/ciudades');
                console.log(response.data)
            } else {
                response = await axios.get(`http://localhost:3000/ciudades?marca=${value}`);
                console.log(response.data)
            }
            const ciudadesAgrupadas = organizarCiudades(response.data);
            setCiudades(ciudadesAgrupadas);
            console.log(ciudades)
            // Establecer todas las ciudades como seleccionadas al inicio
            const todasLasCiudades = response.data.reduce((acumulador, division) => {
                const regiones = Object.values(division);
                return acumulador.concat(regiones.reduce((acc, region) => acc.concat(region), []));
            }, []);
            setCiudadesSeleccionadas(todasLasCiudades);
        } catch (error) {
            console.error('Error fetching data:', error);
        }
    };

    const organizarCiudades = (ciudades) => {
        const ciudadesAgrupadas = {};
        ciudades.forEach(ciudad => {
            const { division, region, ciudad: nombreCiudad } = ciudad;
            const ciudadObj = { division, region, ciudad: nombreCiudad };
            const divisionKey = `${division}`;
            if (!ciudadesAgrupadas[divisionKey]) {
                ciudadesAgrupadas[divisionKey] = {};
            }
            const regionKey = `${region}`;
            if (!ciudadesAgrupadas[divisionKey][regionKey]) {
                ciudadesAgrupadas[divisionKey][regionKey] = [];
            }
            ciudadesAgrupadas[divisionKey][regionKey].push(ciudadObj);
        });
        return ciudadesAgrupadas;
    };

    const deseleccionarDivision = (division) => {
        let updatedCiudadesSeleccionadas = [...ciudadesSeleccionadas];
        // Si la división está seleccionada, deseleccionarla
        if (ciudadesSeleccionadas.some(c => ciudades[division] && Object.values(ciudades[division]).flat().includes(c))) {
            updatedCiudadesSeleccionadas = updatedCiudadesSeleccionadas.filter(ciudad =>
                !Object.keys(ciudades[division]).some(region =>
                    ciudades[division][region].includes(ciudad)
                )
            );
        } else {
            // Si la división está deseleccionada, seleccionarla
            updatedCiudadesSeleccionadas = updatedCiudadesSeleccionadas.concat(Object.values(ciudades[division]).flat());
        }
        setCiudadesSeleccionadas(updatedCiudadesSeleccionadas);
    };

    const deseleccionarRegion = (division, region) => {
        let updatedCiudadesSeleccionadas = [...ciudadesSeleccionadas];
        // Si la región está seleccionada, deseleccionarla
        if (ciudadesSeleccionadas.some(c => ciudades[division] && ciudades[division][region] && ciudades[division][region].includes(c))) {
            updatedCiudadesSeleccionadas = updatedCiudadesSeleccionadas.filter(ciudad =>
                !(ciudades[division] && ciudades[division][region] && ciudades[division][region].includes(ciudad))
            );
        } else {
            // Si la región está deseleccionada, seleccionarla
            updatedCiudadesSeleccionadas = updatedCiudadesSeleccionadas.concat(ciudades[division][region]);
        }
        setCiudadesSeleccionadas(updatedCiudadesSeleccionadas);
    };

    const deseleccionarCiudad = (ciudad) => {
        const updatedCiudadesSeleccionadas = ciudadesSeleccionadas.filter(c => c.id !== ciudad.id);
        setCiudadesSeleccionadas(updatedCiudadesSeleccionadas);
    };

    return (
        <div className="container">
            <h1 className="mt-5 mb-4">Crear Comunicado</h1>
            <form>
                <div className="mt-3">
                    <h2>Marcas</h2>
                    <div className="form-group mt-2">
                        <label htmlFor="selectOption">Selecciona una opción:</label>
                        <select name="marca" id="selectOption" className="form-control" value={marcaSeleccionada} onChange={handleChangeMarca}>
                            <option value="Nacional">Nacional</option>
                            <option value="izzi">izzi</option>
                            <option value="wizz">wizz</option>
                            <option value="wizz plus">wizz plus</option>
                        </select>
                    </div>
                    <p className="mt-2">Seleccionaste: {marcaSeleccionada}</p>
                </div>
                <hr />
                <div className="mt-2 mb-2">
                    <h2>Divisiones, Regiones y Ciudades</h2>
                </div>
                {Object.keys(ciudades).map((division) => (
                    <div key={division}>
                        <hr />
                        <label>
                            <input
                                type="checkbox"
                                checked={true} // Todas las divisiones están seleccionadas
                                onChange={() => deseleccionarDivision(division)}
                            /> {division}
                        </label>
                        <div className="row">
                            {Object.keys(ciudades[division]).map((region) => (
                                <div key={region} className="col-md-4">
                                    <label>
                                        <input
                                            type="checkbox"
                                            checked={true} // Todas las regiones están seleccionadas
                                            onChange={() => deseleccionarRegion(division, region)}
                                        /> {region}
                                    </label>
                                    <ul>
                                        {ciudades[division][region].map((ciudad) => (
                                            <li key={ciudad.id}>
                                                <label>
                                                    <input
                                                        type="checkbox"
                                                        checked={true} // Todas las ciudades están seleccionadas
                                                        onChange={() => deseleccionarCiudad(ciudad)}
                                                    /> {ciudad.ciudad}
                                                </label>
                                            </li>
                                        ))}
                                    </ul>
                                </div>
                            ))}
                        </div>
                    </div>
                ))}
                <button type="submit" className="btn btn-primary mt-5">Guardar</button>
            </form>
            <div>
                <h2>Arreglo de Divisiones, Regiones y Ciudades</h2>
                <pre>{JSON.stringify(ciudades, null, 2)}</pre>
                { console.log(ciudades) }
            </div>
        </div>
    );
}

export default App;