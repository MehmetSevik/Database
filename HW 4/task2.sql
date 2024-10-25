UPDATE petEvent 
SET eventdate = '2020-10-15', eventtype = 'vet', remark = 'antibiotics'
WHERE petname = 'Fluffy' AND eventtype = 'vet' AND eventdate = 'existing_date';
UPDATE petPet 
SET owner = 'Diane', species = 'hamster', gender = 'M', birth = '2010-10-30', death = NULL 
WHERE petname = 'Hammy'; 
UPDATE petEvent 
SET eventdate = '2020-10-16', eventtype = 'litter', remark = '5 kittens, 2 male, 3 female'
WHERE petname = 'Fluffy' AND eventtype = 'litter' AND eventdate = 'existing_date';
UPDATE petEvent 
SET eventdate = '1997-08-03', eventtype = 'vet', remark = 'broken rib'
WHERE petname = 'Claws' AND eventdate = 'existing_date';
UPDATE petPet 
SET death = '2020-09-01' 
WHERE petname = 'Puffball';
DELETE FROM petPet 
WHERE owner = 'Harold' AND species = 'dog';
DELETE FROM petEvent 
WHERE petname IN (SELECT petname FROM petPet WHERE owner = 'Harold' AND species = 'dog');
