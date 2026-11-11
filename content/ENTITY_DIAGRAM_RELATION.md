# Entity Diagram Relation (EDR)

An ER diagram is a visual representation of what data a system stores and how that data relates. It serves as the blueprint for your database before you write a single `CREATE TABLE` statement.

## What they are used for

- Designing a database before implementing it, allowing for the detection of errors while they are still inexpensive to fix.
- Communicating with the team (developers, analysts, business stakeholders) using a shared visual language.
- Documenting an existing system: it is the first thing one looks at when joining a new project.
- Normalizing data: it helps identify duplication and ensures tables are properly separated.
- Planning a JPA model: each entity in the diagram typically corresponds to an Entity.

## Main components

1. Entity: something from the real world about which you store data. It becomes a table. E.g., User, Order, Product.

2. Attributes: the properties of an entity. They become columns. E.g., name, email, creation_date.
   - Primary key (PK): uniquely identifies each record.
   - Foreign key (FK): points to the PK of another entity and establishes the relationship.

3. Relationship: how two entities are connected. E.g., a user places orders.

## Cardinality (most important)

| Type Meaning                          | Example                  | Implementation                               |
| ------------------------------------- | ------------------------ | -------------------------------------------- |
| 1:1 One record relates to exactly     | one other User ↔ Profile | Unique foreign key (FK) in one of the tables |
| 1:N One record relates to many others | User → Orders            | Foreign key (FK) on the “N” side             |
| N:M Many-to-many                      | Orders ↔ Products        | Junction table (with two foreign keys)       |

Many-to-many (N:M) relationships do not exist directly in SQL; they are always resolved using an intermediate table, which often acquires its own attributes (for example, `quantity` and `unit_price` in an `order_details` table).

## How to read “crow’s foot” notation

- `||` → exactly one
- `o|` → zero or one
- `|{` → one or many
- `o{` → zero or many

## From diagram to code

That relation 1 to N for example in JPA it looks like this:

```java
@Entity
public class User {
    @Id
    private UUID userId;

    private String username;

    @OneToMany(mappedBy = "usuario")
    private List<Pedido> pedidos;
}

@Entity
public class Order {
    @Id
    private UUID orderId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User user;
}
```

The side with `@ManyToOne` is the one that holds the FK (the “N” in the diagram), and is therefore the owner of the relationship.

## Levels of an ER diagram

1. Conceptual: includes only entities and relationships, without technical details. Used for discussions with business stakeholders.
2. Logical: adds attributes, primary keys (PKs), and foreign keys (FKs); independent of the database engine.
3. Physical: specifies exact data types, indexes, and constraints specific to the database engine (e.g., PostgreSQL).

## Tools

- dbdiagram.io, draw.io, Lucidchart: for designing from scratch.
- Mermaid: diagrams as code, ideal for GitHub READMEs.
- DBeaver / pgAdmin / DataGrip: generate diagrams from an existing database (reverse engineering).

## Best practices

- Start with the main entities and add detail gradually.
- Use consistent naming (singular or plural—stick to one convention).
- Identify many-to-many (N:M) relationships early and resolve them using an intermediate table.
- Keep the diagram up to date; an outdated diagram is worse than having none at all.
