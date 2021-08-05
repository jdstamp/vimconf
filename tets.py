class Cat(Animal):

    """Predator with soft fur."""

    def __init__(self, paws, fur, flexibility):
        """This has worked well

        :paws: TODO
        :fur: TODO
        :flexibility: TODO

        """
        Animal.__init__(self)

        self._paws = paws
        self._fur = fur
        self._flexibility = flexibility
        for paw in paws:
            print(paw): qa!
