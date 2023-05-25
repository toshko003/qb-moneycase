# QB-Moneycase

QB-Moneycase is a FiveM script that allows users to manage their finances using an interactive money case. It is built to work seamlessly with the QB framework and requires a few dependencies to be installed for it to work correctly.

## Prerequisites

This script requires the following dependencies:

- qb-core
- qb-inventory
- qb-input
- qb-menu

These dependencies should be installed and properly configured on your FiveM server.

## Installation

Follow these steps to install and configure the qb-moneycase script on your server:

1. Clone the repository or download it as a ZIP file.

    ```
    git clone https://github.com/TOSHKO003/qb-moneycase.git
    ```
2. Move the `qb-moneycase` folder to your server's resources directory.

3. Add `start qb-moneycase` or `ensure qb-moneycase` to your server configuration file (server.cfg).

4. To add the `moneycase` item, open the `qb-core/shared/items.lua` file and add the following code:

    ```
    ['moneycase'] = {
        ['name'] = 'moneycase',
        ['label'] = 'Money Case',
        ['weight'] = 0,
        ['type'] = 'item',
        ['image'] = 'moneycase.png',
        ['unique'] = true,
        ['useable'] = true,
        ['shouldClose'] = true,
        ['combinable'] = nil,
        ['description'] = 'A moneycase...'
    },
    ```

5. The `moneycase.png` image from the `images/` directory needs to be added to `qb-inventory/html/images`. Copy the image file and paste it in the specified directory.

6. For the tooltip functionality, add the following code to `qb-inventory/html/js/app.js` right after the "labkey" item data:

    ```
    } else if (itemData.name == "moneycase") {
        $(".item-info-title").html("<p>" + itemData.label + "</p>");
        $(".item-info-description").html(
            "<p><strong>Money: </strong><span>$" +
            itemData.info.money +
            "</span></p>"
        );
    ```

Your qb-moneycase script is now installed and ready to be used.

## Usage

Refer to the documentation for each of the dependencies to learn more about how to use and customize the qb-moneycase functionality.

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License

[MIT](https://choosealicense.com/licenses/mit/)

For more detailed information and help, please refer to the official FiveM documentation and the QB-Core community forums. Enjoy your new financial freedom with qb-moneycase!