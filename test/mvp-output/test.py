import unittest
import pandas as pd

#global datapaths
oldFires = "oldinput/fire_events.csv"
oldLocations = "oldinput/fire_locations.csv"
newFires = "newinput/fire_events.csv"
newLocations = "newinput/fire_locations.csv"

class TestHeaders(unittest.TestCase):
    def test_areFireHeadersSame(self):
        pOldFires = pd.read_csv(oldFires)
        setOldFires = set(pOldFires.head())
        pNewFires = pd.read_csv(newFires)
        setNewFires = set(pNewFires.head())
        self.assertSetEqual(setOldFires,setNewFires)

    def test_areLocationHeadersSame(self):
        pOldLocations = pd.read_csv(oldLocations)
        setOldLocations = set(pOldLocations.head())
        pNewLocations = pd.read_csv(newLocations)
        setNewLocations = set(pNewLocations.head())
        self.assertSetEqual(setOldLocations,setNewLocations)

class DataIntegrity(unittest.TestCase):
    def test_fireContentsSame(self):
        pOldFires = pd.read_csv(oldFires)
        pNewFires = pd.read_csv(newFires)
        dataNewFires = set()
        dataOldFires = set()
        for row in pOldFires:
            dataOldFires.add(str(row))

        for row in pNewFires:
            dataNewFires.add(str(row))

        self.assertSetEqual(dataNewFires,dataOldFires)

    def test_fireLocationsSame(self):
        pOldLocations = pd.read_csv(oldLocations)
        pNewLocations = pd.read_csv(newLocations)
        dataNewLocations = set()
        dataOldLocations = set()
        for row in pOldLocations:
            dataOldLocations.add(str(row))

        for row in pNewLocations:
            dataNewLocations.add(str(row))

        self.assertSetEqual(dataNewLocations,dataOldLocations)
    
if __name__ == "__main__":
    unittest.main()
