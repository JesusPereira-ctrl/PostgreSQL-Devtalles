# DB Design Good Practices

## Let’s ask ourselves:

- What is its purpose?

- How will we use the database?

The design of the database should be scream the purpose and how is it use

## In general, good design helps to:

- Minimize redundancy

- Protect accuracy

- Be accessible

- Meet expectations

## Recommendations:

- Research similar designs beforehand

- Involve stakeholders

- Immerse yourself in the subject matter

Define the objectives

## Principles to follow:

Keep in mind that these principles are recommendations, not strict rules:

- Keep it simple

- Use standardization

- Consider future modifications

- Keep technical debt in check

- Normalize data

- Design for the long term

- Create documentation and diagrams

- Test your design

- Avoid abbreviations (with the exception of standard ones like "i18n" for internationalization)

- Use singular names for tables

- Don't reinvent the wheel

- Leverage the features offered by your database engine

- Use rules, checks, keys, and indexes to prevent "junk" data

- Prioritize privacy

- Use English names and avoid special characters

- Use all lowercase letters with no spaces

- Keep the database on its own dedicated server

- Use version control for your data models

- Choose appropriate data types and the correct level of precision

- Do not rely on third-party identifiers

- Define foreign keys and relationships

- Partition the schema if it becomes too large

- Avoid reserved keywords (e.g., "user", "table", "create")

## Ideas to keep in mind:

- Table and field names will outlive the applications themselves.

- Names are contracts.

- The database takes precedence over everything else.

## Singular-form naming for relations:

Tables, views, and any other type of relation should be named in the singular.

- What about one-to-one relationships? Should these still be in the singular?

- In English, some words do not have a distinct plural form (e.g., "fish," "species," "series").

- Much software is designed around this singular-naming convention, and it works best when followed (from a semantic perspective).

## Explicit naming:

Avoid redundancy and extra reading effort

- person_id vs. id

- Foreign keys should be a combination; for example:

  ```sql
  CREATE TABLE team_member (
      team_id bigint NOT NULL REFERENCES team(id),
      person_id bigint NOT NULL REFERENCES person(id),
      CONSTRAINT team_member_pkey PRIMARY KEY (team_id, person_id);
  );
  ```

- Indices must be explicit: person_idx_first_name_last_name

- This way, when something fails, we know what failed.

- PostgreSQL automatically generates good names.

## Final thoughts:

- If an existing structure follows a different set of rules, stick to those rules.\*

- Do not mix ideologies unless you intend to change everything.

- These steps are useful for starting new designs.
