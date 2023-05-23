import {
  Transfer as TransferEvent
} from "../generated/Vsp/ERC721"
import { Transfer } from "../generated/schema"

export function handleTransfer(event: TransferEvent): void {
  let transferId = event.address.toHex() + '-' + event.params.tokenId.toString();
  let nftTransfer = Transfer.load(transferId);

  if (nftTransfer === null) {
    nftTransfer = new Transfer(transferId);
    nftTransfer.tokenId = event.params.tokenId
    nftTransfer.contractAddress = event.address
  }
  
  nftTransfer.blockTimestamp = event.block.timestamp
  nftTransfer.transactionHash = event.transaction.hash
  nftTransfer.save()
}
