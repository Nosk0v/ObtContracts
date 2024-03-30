const Dice = artifacts.require("./Dice.sol");

contract("Dice", function (accounts) {
  let diceInstance;

  beforeEach(async function () {
    diceInstance = await Dice.new({ from: accounts[0] });
  });

  it("should set manager correctly", async function () {
    const manager = await diceInstance.manager();
    assert.equal(manager, accounts[0], "Manager should be set correctly");
  });

  it("should allow players to enter", async function() {
    const betAmount = web3.utils.toWei("0.002", "ether");
    const initialPlayersCount = (await diceInstance.players()).length;

    // Вступление нового игрока
    await diceInstance.Enter({ value: betAmount, from: accounts[1] });

    const finalPlayersCount = (await diceInstance.players()).length;

    // Проверка, что количество игроков увеличилось на 1
    assert.equal(finalPlayersCount, initialPlayersCount + 1, "Player should be able to enter");
});





  it("should correctly determine the winner", async function () {
    const betAmount = web3.utils.toWei("0.002", "ether");
    await diceInstance.Enter({ value: betAmount, from: accounts[1] });
    await diceInstance.CEO();
    const result = await diceInstance.Winner({ value: betAmount });
    assert.equal(result.receipt.status, true, "Winner function should execute successfully");
  });
});
