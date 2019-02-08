update Hosts
set tmLastUpdate=tmLastInfoUpdate

update Hosts
set tmLastNagentConnected=tmLastInfoUpdate


update Hosts
set nStatus=29 , bSyncState=1

UPDATE hst_host_status
SET status_id=0, status_mask=0


