<table id="bgrd-table" class="table">
    <?php
    if (isset($tableToPrint)) { ?>
        <thead>
            <tr>
                <th scope="col">#</th>
                <?php foreach ($tableToPrint->getHeader() as $colName) : ?>
                    <th scope="col"><?= $colName ?></th>
                <?php endforeach ?>
            </tr>
        </thead>
        <tbody>
            <?php
            $cnt = 1;
            foreach ($tableToPrint->getData() as $row) : ?>
                <tr>
                    <th scope="row"><?= $cnt ?></th>
                    <?php foreach ($row as $element) : ?>

                        <td><?= $element ?></td>

                    <?php endforeach ?>
                </tr>
            <?php
                $cnt++;
            endforeach ?>

        </tbody>
    <?php
    } ?>
</table>