import Array "mo:base/Array";
import Types "./Types";
import Buffer "mo:base/Buffer";
import Result "mo:base/Result";
import Bool "mo:base/Bool";
import Util "./Util";

actor Main {
  var counter:Float = 0;
  type Person = Types.Person;

  stable var people:[Person]  =  [];

  public func increase() : async Float {
    counter+=1;
    return counter;
  };

  public func decrease() : async Float {
    counter-=1;
    return counter;
  };

  public query func showCounter() : async Float {
    return counter;
  };

  public func addPerson(newPerson:Person) : async Text  {
    let buffer: Buffer.Buffer<Person> = Buffer.Buffer(people.size());

    for(element in people.vals()) {
        buffer.add(element);
    };

    buffer.add(newPerson);
    people:= buffer.toArray();

    return "Work done";
  };

  public func removePerson(firstName:Text) : async Result.Result<Text, Text> {
    let newArr = Array.filter(people, func(person:Person):Bool {
        person.firstName != firstName;
    });

    if(newArr.size() < people.size()) {
      people:=newArr;
      return #ok("Deleted");
    };

    return #err("Not found");

  };

  public func getPeople() : async [Person] {
    return people;
  };


};
