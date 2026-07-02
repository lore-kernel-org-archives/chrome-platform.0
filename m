Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67622C0268
	for <chrome-platform@lists.linux.dev>; Thu,  2 Jul 2026 08:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782980895; cv=none; b=jwKnOJJMGVnYd03yby7cSyf4a60Tg1hrdGqp9Aoq2YQ3IoGARlIfhJa0Mc14WtY1tcVhO19TXysl+LVds2zZzRQ+ffu4a6zwYCDuX2wtqZJNioKhmg9+AJLH8C7Md/UKNqywdRIUz5HH/jtB+oj+OaoeYhJJyaclJI4vYJX2Lzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782980895; c=relaxed/simple;
	bh=we/i+eiPaXMHvL8U3R7szJgPd33VzcrtucL1oOleASA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CvWTEI4+lQZXlTLZcAH2mL4sH/FZaT0R4MyY4/lNTnbpGjCV1l6eoMCpNMBWP1MjCsBuYeROtyW/iy8pE14eVyzM05lERtb3vG2jtWNMVKmhZ8msA68vc+kO3q02Hxk/Qjaz/KWUgAyVqyAkVVlB98mN0AMD7UC0nrLheqsvmIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cSA/NKl9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cSA/NKl9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AADA1F000E9;
	Thu,  2 Jul 2026 08:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782980893;
	bh=lgpq5mpiypaFwykhQGDBnwAXCIle7+PYkkbUc7DPYtA=;
	h=From:To:Cc:Subject:Date;
	b=cSA/NKl90fMCuqkFhxuEbGRfOcxzUPMsKxh81Kk9uwmNTDr1WtTHaqmDHpRhxwjAm
	 JYdQGcWWxIq61L0Z6b+n9IiV6+YDA1Gk2vcCn9sLaQnlQ2q3iqkb7eLhUhNfiZVqAC
	 fAIin49wMvWabHbIRxJ8E8EDLEqsBFcIIFR8c7hrDMbKMbi/Y5FQX+4wxFWu9GLB1E
	 skiLaTe+BI9EDoZkiIKrguXzA5WyIRV0eOHjoHhSxFmQ67vK8Yr8gO7+Nj10A5Zjh9
	 utXYJJJG/VK9FeDo4oOoeVnG75JS4LZjDfO/wzNsF1XaQcGMdPjfW98FkFJbta3+BR
	 z1t+MHpqnGFJQ==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Benson Leung <bleung@chromium.org>
Cc: tzungbi@kernel.org,
	chrome-platform@lists.linux.dev,
	tfiga@chromium.org,
	suleiman@chromium.org
Subject: [PATCH v2] platform/chrome: sensorhub: Fix memory overread in ring handler
Date: Thu,  2 Jul 2026 08:27:45 +0000
Message-ID: <20260702082745.1014968-1-tzungbi@kernel.org>
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

Check the return value of cros_ec_cmd_xfer_status() and abort if the
number of bytes read does not match the expected length.

Fixes: 145d59baff59 ("platform/chrome: cros_ec_sensorhub: Add FIFO support")
Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
v2:
- Abort if the number of bytes read doesn't match the expected length.

v1: https://lore.kernel.org/all/20260629092414.3028387-1-tzungbi@kernel.org
---
 drivers/platform/chrome/cros_ec_sensorhub_ring.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/cros_ec_sensorhub_ring.c b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
index a10579144c34..988ecef93342 100644
--- a/drivers/platform/chrome/cros_ec_sensorhub_ring.c
+++ b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
@@ -825,8 +825,15 @@ static void cros_ec_sensorhub_ring_handler(struct cros_ec_sensorhub *sensorhub)
 		sensorhub->msg->outsize = 1;
 		sensorhub->msg->insize = fifo_info_length;
 
-		if (cros_ec_cmd_xfer_status(ec->ec_dev, sensorhub->msg) < 0)
+		ret = cros_ec_cmd_xfer_status(ec->ec_dev, sensorhub->msg);
+		if (ret < 0)
+			goto error;
+		if (ret != fifo_info_length) {
+			dev_warn_ratelimited(sensorhub->dev,
+					     "Mismatch read length: size %d - expected %d\n",
+					     ret, fifo_info_length);
 			goto error;
+		}
 
 		memcpy(fifo_info, &sensorhub->resp->fifo_info,
 		       fifo_info_length);
-- 
2.55.0.rc0.799.gd6f94ed593-goog

