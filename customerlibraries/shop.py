import time

from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn


@library
class Shop:
    def __init__(self):
        self.selenium_library = BuiltIn().get_library_instance("SeleniumLibrary")

    @keyword
    def add_items_to_cart_and_checkout(self, productslist):
        products_title = self.selenium_library.get_webelements("css:.card-title")
        add_to_cart_button = self.selenium_library.get_webelements("css:.btn-info")

        if not isinstance(productslist, (list, tuple)):
            raise ValueError("productslist must be a list or tuple")

        if not productslist:
            raise ValueError("productslist can not be empty")

        if len(products_title) != len(add_to_cart_button):
            raise ValueError(f"Mismatch: Found {len(products_title)} products but "
                             f"{len(add_to_cart_button)} buttons.")

        for index, product_title in enumerate(products_title, start=0):
            if product_title.text in productslist:
                self.selenium_library.click_button(add_to_cart_button[index])
        self.selenium_library.click_link("css:li.active a")

        # testing





