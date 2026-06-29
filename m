Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3AEBE63
	for <chrome-platform@lists.linux.dev>; Mon, 29 Jun 2026 09:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782725071; cv=none; b=eBkHwgFroHVOvFM/cNksIzrrbhOg2rj1qZZ3aFW5JzDcJEvq+JDdYIRNRWceNOTFBNW6bXJT9fd0XZsQcRaNx/xXf2VSt0i3JNmBtm8Wt0YepyBw/RK9E50HAdoZCahlFR2eJ//9zOgqN+NwDc//VIKsumh6n+OKe1p8+gROl5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782725071; c=relaxed/simple;
	bh=4zW8pIYQ5mY/+86kdJ03swovfAZK13M1kRffKVz7FVY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UGBPP9UkJ8wOCahAgT4o9tJU3EMoeHvLAQ+s+5M2O153zLMk2zKCZar72njy/syD82RTwX9m2RJONwLUVs+e/IVfYF3FUJqxkJZFu+K9tKCtLSSe9uR+RkD1oEyZCasci1k4mM3U3dU8aSr2itkYAtC7DNQYsw4HGXenTSbBNcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UgOx9dBD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UgOx9dBD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3248F1F000E9;
	Mon, 29 Jun 2026 09:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782725070;
	bh=OFOhLYnfMBiOqtrwIjWulGEQCBYdZiIrp0xrcZZ1jgQ=;
	h=From:To:Cc:Subject:Date;
	b=UgOx9dBDKpe+WaNAU09MNMtYIlVGxa9TxXtiPO2OzciS7kJzak5njlJMyeDVFd+r6
	 Lc/7pvigkfhA/97f3329HlMkQd3xthhbK6OMF7nPEtdroLJ+10cO18fJESgl1oXFXV
	 7BTgwqK/0/x2QWqKNcst6YexhsIQblWVWHJumfA6lKnJcgLjHLUpraJ93CX9zk48H5
	 p7NzLdWmPR/wpqm9OU6i1G/SyHJ4zB7ZCAFGS2wq9SJdUuTOKXv5jK5rPjm+MEKetT
	 bcZlzGYozOeCBsFCfNxiBDHPkMLz7QD3MX0fGh+hhrYA3e9sj45L+TEP5ECW9LxLz7
	 Jqy9Bm3miVPqA==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Benson Leung <bleung@chromium.org>
Cc: tzungbi@kernel.org,
	chrome-platform@lists.linux.dev,
	tfiga@chromium.org,
	suleiman@chromium.org
Subject: [PATCH] platform/chrome: sensorhub: Fix memory overread in ring handler
Date: Mon, 29 Jun 2026 09:24:14 +0000
Message-ID: <20260629092414.3028387-1-tzungbi@kernel.org>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

`max_response` and `sensor_num` are read from different EC commands:

- `max_response` is from cros_ec_get_proto_info().
    ec_dev->max_response = info->max_response_packet_size -
                                    sizeof(struct ec_host_response);

- `sensor_num` is from cros_ec_get_sensor_count().
    sensor_num = cros_ec_get_sensor_count(ec);

With a malfunctioning EC firmware, it is possible that the `msg->insize`
(i.e., `fifo_info_length` in the context) could be clamped in
cros_ec_cmd_xfer() because `msg->insize` is greater than `max_response`.

    int fifo_info_length =
            sizeof(struct ec_response_motion_sense_fifo_info) +
            sizeof(u16) * sensorhub->sensor_num;

This means the number of read bytes could be less than expected.  As a
result, the subsequent memcpy() in cros_ec_sensorhub_ring_handler()
overreads the `resp->fifo_info` buffer.

Check the return value of cros_ec_cmd_xfer_status() and clamp the length
passed to memcpy() to the actual number of bytes read.

Fixes: 145d59baff59 ("platform/chrome: cros_ec_sensorhub: Add FIFO support")
Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 drivers/platform/chrome/cros_ec_sensorhub_ring.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_sensorhub_ring.c b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
index 64e9615ed6f4..4b4adc38485c 100644
--- a/drivers/platform/chrome/cros_ec_sensorhub_ring.c
+++ b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
@@ -825,11 +825,19 @@ static void cros_ec_sensorhub_ring_handler(struct cros_ec_sensorhub *sensorhub)
 		sensorhub->msg->outsize = 1;
 		sensorhub->msg->insize = fifo_info_length;
 
-		if (cros_ec_cmd_xfer_status(ec->ec_dev, sensorhub->msg) < 0)
+		ret = cros_ec_cmd_xfer_status(ec->ec_dev, sensorhub->msg);
+		if (ret < 0)
 			goto error;
 
 		memcpy(fifo_info, &sensorhub->resp->fifo_info,
-		       fifo_info_length);
+		       min(fifo_info_length, ret));
+
+		if (ret < fifo_info_length) {
+			dev_info_ratelimited(sensorhub->dev,
+					     "Read less FIFO info: size %d - expected %d\n",
+					     ret, fifo_info_length);
+			memset((u8 *)fifo_info + ret, 0, fifo_info_length - ret);
+		}
 
 		/*
 		 * Update collection time, will not be as precise as the
-- 
2.55.0.rc0.799.gd6f94ed593-goog

