import * as fs from "fs";

type City = {
    cost: number;
    client: number;
};

const input = fs.readFileSync(0).toString().trim().split('\n');
const [c, n] = input[0].split(' ').map(Number);
const cities: City[] = input.slice(1).map(line => {
    const [cost, client] = line.split(' ').map(Number);
    return { cost, client };
});
const dp = new Array(c + 101).fill(Infinity);
dp[0] = 0;
for (let i = 0; i <= c; i++) {
  for (const { cost, client } of cities) {
    const next = i + client;
    if (dp[i] + cost < dp[next]) {
      dp[next] = dp[i] + cost;
    }
  }
}
let answer = Math.min(...dp.slice(c));
console.log(answer);
