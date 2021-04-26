package usersTracking.entities;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import usersTracking.entities.Person;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2021-04-26T11:45:57")
@StaticMetamodel(Person.class)
public class Person_ { 

    public static volatile ListAttribute<Person, Person> personList;
    public static volatile SingularAttribute<Person, String> name;
    public static volatile SingularAttribute<Person, Integer> id;
    public static volatile ListAttribute<Person, Person> personList1;

}