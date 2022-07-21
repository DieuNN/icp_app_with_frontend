import Array "mo:base/Array";
import Buffer "mo:base/Buffer";
import Types "./Types";


module {
    private type Person = Types.Person;

    public func arrayToPeopleBuffer(array:[Person]) : Buffer.Buffer<Person> {
        let buffer:Buffer.Buffer<Person> = Buffer.Buffer(array.size());

        for(element in array.vals()) {
            buffer.add(element);
        };

        return buffer;
    }
}