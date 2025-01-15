# Base de Dades Tienda i Sistema Educatiu

Aquest repositori conté solucions a diversos exercicis SQL relacionats amb la gestió d'una base de dades de productes, fabricants, i un sistema educatiu. Les consultes inclouen operacions de selecció, ordenació, agrupació i combinacions de taules utilitzant **JOINs**.

## Contingut

### **Secció 1: Tienda**
Treballarem amb dues taules principals:  
1. **producto**  
   - **Camps**: `codigo`, `nombre`, `precio`, `codigo_fabricante`  
2. **fabricante**  
   - **Camps**: `codigo`, `nombre`  

#### Consultes realitzades:
1. Llistar el nom de tots els productes.
2. Llistar els noms i preus dels productes.
3. Llistar totes les columnes de la taula `producto`.
4. Llistar el nom dels productes amb el preu en euros i en dòlars (USD).
5. Mostrar els productes amb àlies: `nom de producto`, `euros`, `dòlars`.
6. Convertir els noms dels productes a majúscula.
7. Convertir els noms dels productes a minúscula.
8. Obtenir els primers dos caràcters en majúscula del nom dels fabricants.
9. Arrodonir el preu dels productes.
10. Truncar el preu dels productes a enters.
11. Llistar codis únics de fabricants amb productes.
12. Ordenar els noms dels fabricants de manera ascendent i descendent.
13. Ordenar els productes pel nom (ascendent) i preu (descendent).
14. Obtenir les primeres 5 files de la taula `fabricante`.
15. Retornar 2 files a partir de la quarta fila de `fabricante`.

---

### **Secció 2: Sistema Educatiu**
Treballarem amb taules relacionades amb alumnes, professors/es, assignatures i departaments.

#### Consultes destacades:
1. **Llistats de dades bàsiques**:  
   - Nom i cognoms dels alumnes ordenats alfabèticament.  
   - Alumnes sense número de telèfon.  
   - Professors/es amb NIF acabat en "K" sense telèfon.  
   - Assignatures del primer quadrimestre en cursos específics.  
   - Professors/es amb el departament associat.

2. **Anàlisi temporal**:  
   - Alumnes nascuts en 1999.  
   - Cursos de l'alumne amb NIF `26902806M`.  
   - Assignatures impartides en graus específics.

3. **Ús de JOINs**:  
   - Professors/es sense departament.  
   - Departaments sense professors/es.  
   - Assignatures sense professor/a assignat.  
   - Departaments sense cursos impartits.  

4. **Consultes resum**:  
   - Nombre total d'alumnes.  
   - Professors/es per departament (incloent aquells amb 0 professors/es).  
   - Nombre d'assignatures per grau (inclosos graus sense assignatures).  

---

## Com executar les consultes

1. **Clona aquest repositori**:
   ```bash
   git clone <repositori-url>
   ```
2. **Crea la base de dades**:  
   Executa els scripts SQL proporcionats a `setup.sql` per crear i omplir les taules necessàries.  
3. **Executa les consultes**:  
   - Carrega el fitxer `queries.sql` en el teu client SQL preferit (MySQL Workbench, DBeaver, etc.).
   - Executa les consultes individualment o per blocs segons els requeriments.

---

## Exemple de resultats esperats

### Secció Tienda
**Consulta**: Llistar el nom dels productes amb preus en euros i dòlars.  
```sql
SELECT nombre AS "nom de producto",
       precio AS "euros",
       precio * 1.10 AS "dòlars"
FROM producto;
```
**Resultat**:
| nom de producto | euros | dòlars  |
|------------------|-------|---------|
| Televisor        | 400   | 440.00  |
| Nevera           | 300   | 330.00  |

### Secció Sistema Educatiu
**Consulta**: Professors/es sense departament.  
```sql
SELECT p.nom, p.primer_cognom, p.segundo_cognom
FROM professors p
LEFT JOIN departaments d
ON p.id_departament = d.id
WHERE d.id IS NULL;
```
**Resultat**:
| nom     | primer_cognom | segundo_cognom |
|---------|---------------|----------------|
| Marta   | López         | Gómez          |
| Carlos  | García        | Ruiz           |

---

## Requisits del sistema

- **SGBD**: MySQL o MariaDB.  
- **Eines recomanades**: MySQL Workbench, DBeaver, o phpMyAdmin.  
- **Versió SQL**: Compatible amb SQL estàndard i extensions de MySQL.

---

## Autor

Creat per **Antonio Carrasco**. Per a qualsevol dubte o suggeriment, pots contactar-me.

---

## Llicència

Aquest projecte està sota la llicència MIT. Consulta el fitxer `LICENSE` per a més detalls.

