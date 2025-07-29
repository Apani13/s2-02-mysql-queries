#S02.02 – MySQL Queries Practice

🎯 **Objectives**

* Strengthen your ability to **read and write SELECT statements** for real‑world scenarios.
* Practise **functions, filtering, ordering, limiting, aggregation and sub‑queries**.
* Explore **JOIN strategies** (INNER, LEFT, RIGHT) and spot when each one shines.
* Earn progressive achievement badges while working with the **Store (`tienda`)** and **University (`universidad`)** schemas.

---

🏆 **Achievement Levels**

| Level                         | Requirements                                         | Focus                                               |
| ----------------------------- | ---------------------------------------------------- | --------------------------------------------------- |
| 🥉 **Level 1 (Basic)**        | ≥ 37 queries solved **and** ≥ 20 University queries  | Single‑table SELECT, simple filtering & ordering    |
| 🥈 **Level 2 (Intermediate)** | 37‑56 queries solved **and** ≥ 20 University queries | JOINs, grouping, basic sub‑queries                  |
| 🥇 **Level 3 (Advanced)**     | > 56 queries solved **and** ≥ 20 University queries  | Complex joins, correlated sub‑queries, optimisation |

---

🔹 **Store Database Exercises**

#### 📌 Schema

```
producto   (codigo, nombre, precio, codigo_fabricante)
fabricante (codigo, nombre)
```

Relation → `producto.codigo_fabricante → fabricante.codigo`

##### 📘 Basic Queries (01‑15)

1. List all product names.
2. List product names and prices.
3. List every column from `producto`.
4. Name plus price in € and **USD**.
5. Same as #4 using column aliases **product\_name, euros, dollars**.
6. Names in **UPPER CASE** and prices.
7. Names in **lower case** and prices.
8. Manufacturer name + first **2 chars uppercase**.
9. Names and **rounded** prices.
10. Names and **truncated** (integer) prices.
11. Manufacturer codes present in `producto`.
12. Same as #11 with `DISTINCT`.
13. Manufacturer names **A→Z**.
14. Manufacturer names **Z→A**.
15. Products ordered by **name ASC**, **price DESC**.

##### 📘 Intermediate Queries (16‑32)

16. First **5** rows of `fabricante`.
17. **2** rows starting from row 4 (i.e. rows 4 & 5).
18. Cheapest product (use `ORDER BY` + `LIMIT`).
19. Most expensive product (use `ORDER BY` + `LIMIT`).
20. Products from manufacturer **#2**.
21. Product name, price **&** manufacturer name.
22. Same as #21 ordered by manufacturer.
23. Product\_code, product\_name, manufacturer\_code, manufacturer\_name.
24. Cheapest product with manufacturer.
25. Most expensive product with manufacturer.
26. All **Lenovo** products.
27. **Crucial** products priced **> €200**.
28. Products by **Asus, Hewlett‑Packard & Seagate** (without `IN`).
29. Same as #28 **with `IN`**.
30. Products where manufacturer **ends with ‘e’**.
31. Products where manufacturer **contains ‘w’**.
32. Products **≥ €180** ordered by **price DESC**, **name ASC**.

##### 📘 Advanced Queries (33‑41)

33. Manufacturer **codes & names** that own products.
34. Every manufacturer with its products (include those with none).
35. Manufacturers **without products**.
36. All Lenovo products **(no INNER JOIN)**.
37. Products priced exactly like Lenovo’s most expensive (no `INNER JOIN`).
38. Name of Lenovo’s **most expensive** product.
39. Name of Hewlett‑Packard’s **cheapest** product.
40. Products priced **≥** Lenovo’s most expensive product.
41. Asus products priced **above their own average**.

---

🔹 **University Database Exercises**

Download and import **`schema_universidad.sql`** before starting. Explore the E‑R diagram in MySQL Workbench or DBeaver.

##### 📘 Basic Queries (01‑09)

1. Students – first surname, second surname, name – ordered alphabetically.
2. Students **without phone numbers**.
3. Students **born in 1999**.
4. Professors **without phone** whose **NIF ends in ‘K’**.
5. Subjects taught in **semester 1, year 3** of degree **ID 7**.
6. Professors plus their department name (ordered).
7. Subject name, academic year **start & end** for student **NIF 26902806M**.
8. Departments with professors teaching the **B.Sc. Computer Engineering (Plan 2015)**.
9. Students who enrolled during **2018/2019**.

##### 📘 JOIN Queries (10‑15)

10. All professors with their departments (include unassigned professors).
11. Professors **without departments**.
12. Departments **without professors**.
13. Professors **teaching no subject**.
14. Subjects **without an assigned professor**.
15. Departments that **never taught** any subject.

##### 📘 Summary / Aggregation Queries (16‑26)

16. Total number of students.
17. Students born in 1999 (count).
18. Professors per department (only departments with professors) ordered by count **DESC**.
19. All departments with the number of professors (include zero).
20. All degrees with the number of subjects (include zero), ordered by subject count **DESC**.
21. Same as #20 but **only degrees with > 40 subjects**.
22. Degree name, **subject type**, total **credits** per type.
23. Academic year start & student enrolment count.
24. Number of subjects taught by each professor (include zero), ordered by subject count **DESC**.
25. **Youngest** student – all columns.
26. Professors **with a department** who **teach no subject**.

---

🛠️ **Technologies Used**

* **MySQL 8.x** (or **MariaDB 10.5+**)
* **SQL** language & functions
* *Optional* **MySQL Workbench / DBeaver / HeidiSQL** for visual design
* **Git** for version control
* **Markdown** for documentation

---

⚙️ **Installation & Quick‑Start**

##### 📋 Requirements

* MySQL 8.0+ (or MariaDB 10.5+)
* A SQL client (Workbench, DBeaver, HeidiSQL…)
* Schema & seed files located in **`/schemas`**:

  * `schema_tienda_structure‑datatest.sql`
  * `schema_universidad_structure‑datatest.sql`
* Git (optional for version control)

##### 🛠️ Setup

```bash
# Clone this repo
$ git clone https://github.com/your‑username/s2‑02‑mysql‑queries.git
$ cd s2‑02‑mysql‑queries

# Import the Store schema + sample data
$ mysql -u root -p < schemas/schema_tienda_structure-datatest.sql

# Import the University schema + sample data
$ mysql -u root -p < schemas/schema_universidad_structure-datatest.sql
```

##### ▶️ Execution Examples

```sql
-- Switch to the Store DB
USE tienda;

-- Example: Basic Query #1
SELECT nombre FROM producto;

-- Switch to the University DB
USE universidad;

-- Example: Summary Query #16
SELECT COUNT(*) AS total_students FROM alumno;
```

Feel free to paste your solutions into **`queries_tienda.sql`** and **`queries_universidad.sql`**, then run `SOURCE your_file.sql` to test them.

---

🌐 **Deployment**
The schemas are portable — run them on a local server, Docker container or cloud database that supports MySQL 8.x syntax.

📦 **Repository Hints**

* Group queries logically inside the SQL files using `-- --------` dividers.
* Name branches after the task: `feat/tienda-basic-queries`.

✅ **Author Notes**
Solving the same question in multiple ways (JOIN vs. sub‑query) is encouraged. Be extra‑careful with `NULL` handling – many edge cases hide there.

**Happy querying!** 🚀
