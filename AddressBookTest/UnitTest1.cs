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

        [Test]
        public void GetpersonbyType()
        {
            Contact model = new Contact();
            model.Type = "Family";
            AddressBookMain addressBookMain = new AddressBookMain();
            int count = addressBookMain.GetPersonType(model);
            Assert.AreEqual(2, count);
        }

        [Test]
        public void GetpersonbyCityName()
        {
            Contact model = new Contact();
            model.City = "Moradabad";
            AddressBookMain addressBookMain = new AddressBookMain();
            int count = addressBookMain.GetPersonByCity(model);
            Assert.AreEqual(1, count);
        }

        [Test]
        public void AddpersonInDatabase()
        {
            Contact model = new Contact
            {
                FName = "Parnika",
                LName = "Singh",
                Address = "C-24",
                PhoneNumber = 7894652130,
                Email = "pari23@gmail.com",
                City = "Kanpur",
                State = "UP",
                ZipCode = 123456,
                Type = "Friend"
            };
            AddressBookMain addressBookMain = new AddressBookMain();
            int result = addressBookMain.AddPresoninAddressBook(model);
            Assert.AreEqual(1, result);
        }
    }
}