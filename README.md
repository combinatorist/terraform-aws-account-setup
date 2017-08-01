# terraform environments = AWS account profiles
If you're blessed with the responsibility to administer multiple AWS accounts,
then you could use this single terraform repository to deploy each account. Just
create a new terraform environment for each of your AWS profiles (names must
literally match). Note, the danger here of course is that you could
accidentally create multiple backends in the same account where you have
multiple profiles. You also might accidentally apply changes to one account that
were intended for another.
