using AddressBook;

namespace AddressBookTest
{
    public class Tests
    {
        [Test]
        public void ShouldRetrieveAllPerson()
        {
            AddressBookMain addressBookMain = new AddressBookMain();
            int count = addressBookMain.GetPerson();
            Assert.That(count, Is.EqualTo(8));
        }
    }
}