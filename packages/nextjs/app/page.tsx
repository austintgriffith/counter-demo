"use client";

import { useState } from "react";
import { Address } from "@scaffold-ui/components";
import { useDeployedContractInfo, useScaffoldReadContract, useScaffoldWriteContract } from "~~/hooks/scaffold-eth";
import type { NextPage } from "next";

const Home: NextPage = () => {
  const { data: counterContract } = useDeployedContractInfo("Counter");

  const { data: count } = useScaffoldReadContract({
    contractName: "Counter",
    functionName: "count",
    watch: true,
  });

  const { writeContractAsync, isMining } = useScaffoldWriteContract("Counter");

  const [isIncrementing, setIsIncrementing] = useState(false);

  const loading = isMining || isIncrementing;

  const handleIncrement = async () => {
    setIsIncrementing(true);
    try {
      await writeContractAsync({
        functionName: "increment",
      });
    } catch (e) {
      console.error("Increment failed:", e);
    } finally {
      setIsIncrementing(false);
    }
  };

  return (
    <div className="flex items-center flex-col grow pt-10">
      <div className="flex flex-col items-center justify-center flex-grow gap-8 px-5">
        <div className="text-8xl font-bold tabular-nums">
          {count !== undefined ? count.toString() : "—"}
        </div>

        <button
          className="btn btn-primary btn-lg text-lg"
          onClick={handleIncrement}
          disabled={loading}
        >
          {loading ? (
            <>
              <span className="loading loading-spinner loading-sm"></span>
              Incrementing...
            </>
          ) : (
            "Increment"
          )}
        </button>
      </div>

      <div className="text-center mt-auto mb-8 text-sm opacity-70">
        <p>Counter Contract:</p>
        <Address address={counterContract?.address} />
      </div>
    </div>
  );
};

export default Home;
