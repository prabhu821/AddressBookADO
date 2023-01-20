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

        [Test]
        public void ShouldUpdatePerson()
        {
            Contact model = new Contact
            {
                ID = 3,
                Address = "6th cross street",
                PhoneNumber = 7894561230
            };
            AddressBookMain addressBookMain = new AddressBookMain();
            int result = addressBookMain.UpdatePresoninAddressBook(model);
            Assert.AreEqual(1, result);
        }
    }
}