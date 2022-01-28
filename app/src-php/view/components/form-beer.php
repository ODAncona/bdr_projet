<form action="/enregistrer-biere" method="POST">
    <div class="form-group">
        <label for="beerName">Nom de la bière</label>
        <input name="beerName" type="text" class="form-control" id="beerName" placeholder="Nom de la bière">
    </div>

    <div class="form-group">
        <label for="breweryName">Nom de la brasserie</label>
        <input name="breweryName" type="text" class="form-control" id="breweryName" placeholder="Nom de la brasserie">
    </div>

    <div class="form-group">
        <label for="price">Prix</label>
        <input name="price" type="number" placeholder="0.0" step="0.1" class="form-control" id="price" placeholder="Prix de la bière">
    </div>

    <div class="col-auto my-1">
        <label class="mr-sm-2" for="inlineFormCustomSelect">Type de bière</label>
        <select name="beerType" class="custom-select mr-sm-2" id="inlineFormCustomSelect">
            <option selected>Choose...</option>
            <?php foreach ($beerTypesArray as $type) : ?>
            <option value="<?= $type ?>"> <?= $type ?> </option>
            <?php endforeach ?>
        </select>
    </div>

    <button type="submit" class="btn btn-primary">Submit</button>
</form>