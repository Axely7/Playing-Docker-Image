const { syncDB } = require("../../tasks/sync-db")


describe('Pruebas en Sync-DB', () => { 
    test('Debe de ejecutar el procesos 2 veces', () => { 
        syncDB();
        const times = syncDB();

        console.log('Se llamó',times)

        expect(times).toBe(2);
     })
 })