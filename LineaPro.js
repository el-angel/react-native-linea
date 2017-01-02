import { Linea } from './NativeBridges';

export class LineaPro {
    getTest(name) {
        return new Promise(resolve => {
            Linea.getObject('hoi', (name) => {
                console.log(name, 'HAHHANAME');
                resolve(name);
            });
        });
    }

    async connect() {
        try {
            const name = await Linea.connect();
            return "H:AHAHH";
        } catch (e) {
            console.error(e);
        }
    }
}

module.exports = LineaPro;