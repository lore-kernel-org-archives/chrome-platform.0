Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E98B282F2A
	for <chrome-platform@lists.linux.dev>; Tue, 14 Jul 2026 06:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784011964; cv=none; b=oAWlMxRcYNGkKEl3eYGuKwDYJBQeYRbFpNziuj27KLVmaKNYdmhzqm98HeHv2vJYRKNNgI8A+896xQ2s/9yx3u55fA9NEcg/4gQvcc1QowT2nolPYIz0y6Dp4O2s8eWgMIBie7fiXRyz6iE9ucmb3qwt5VOfLOsTrXAz0t7IGiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784011964; c=relaxed/simple;
	bh=SXocpZPa8jHvWzNF/f90bQuFYze+F0tb5cqMN344NN8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dVf4iHVoCIYwnpA1IGYvZYQssbB5vAeolGACNy6icV3RX90cIo2x4runtd8CCdi4y7oJ5j3Wq8nMc26SJ2nYwHcFeL1zFZkr3JzNSnh5aH0gRwGQwA63dDegPWow85aFP3idiPz1a8wovIpy7Lib77JM6jZE2r2EcibSwi1Vko4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hUA+/W2X; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hUA+/W2X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F79D1F000E9;
	Tue, 14 Jul 2026 06:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784011963;
	bh=hYmuwhJ0U9z38vUvXcEiBZXx12KLeZPjnGzVJLsSnXU=;
	h=From:To:Cc:Subject:Date;
	b=hUA+/W2XyZKfvV8CylHG4QRIbUGCiMcWjdVJOcUhVVKa160ycKZVATXV9MvecA1Pk
	 DV8sy/8w10jKk9L/4xAeJn92fs6hCUJN62A5/3WBhxj2GL6AEXaIcuHdNX/1MhDTDx
	 /wcd3MSVsEmHBJkIPAHD6Z8jeYY0EuKczRjYPz/uXK9U5us0sRpn9Bf6wUHM6yuUd3
	 Sq0l1sRt1KxSdrsjcCY8v1GuiaEjsVJIYonk1P3vsHtMPKTcKp/Vxp0pR/1cvCQOVP
	 oVmSssq+O0/ELRPXzwgqVRTq2Nl84RX6aUyKdqE0KG/SKuylyoJwdUrPitrBjhGh6N
	 WkQRvt2Eagkrw==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Benson Leung <bleung@chromium.org>
Cc: Bryam Vargas <hexlabsecurity@proton.me>,
	tzungbi@kernel.org,
	chrome-platform@lists.linux.dev,
	tfiga@chromium.org,
	suleiman@chromium.org
Subject: [PATCH] platform/chrome: sensorhub: Fix dropped timestamp events and log spam
Date: Tue, 14 Jul 2026 06:52:02 +0000
Message-ID: <20260714065202.3248017-1-tzungbi@kernel.org>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 833740a2333c ("platform/chrome: sensorhub: Bound the EC-reported
sensor number") evaluated the `sensor_num` against the bounds limit even
for timestamp events.  A timestamp event typically has a `sensor_num` of
0xff [1], causing the driver to flag it as invalid and skip to the next
event.

As a result, we'd see a flooding of "Invalid sensor number 255 from EC"
warning logs and these timestamp events were being dropped.

Additionally, the firmware only ORs the tablet mode flag [2] onto
timestamp events.  Because the firmware strictly generates standalone
timestamps (without other flags like ODR or FLUSH), bypassing the bounds
check for anything containing the TIMESTAMP flag is safe and avoids
invalid array access.

Skip the bounds check for events carrying the
MOTIONSENSE_SENSOR_FLAG_TIMESTAMP flag.

[1] https://crrev.com/219ca6ef82ba266da788b673ee4ad50bd3ea1285/common/motion_sense_fifo.c#427
[2] https://crrev.com/219ca6ef82ba266da788b673ee4ad50bd3ea1285/common/motion_sense_fifo.c#296

Fixes: 833740a2333c ("platform/chrome: sensorhub: Bound the EC-reported sensor number")
Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 drivers/platform/chrome/cros_ec_sensorhub_ring.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_sensorhub_ring.c b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
index 92941924c347..e0a1bc19dc7f 100644
--- a/drivers/platform/chrome/cros_ec_sensorhub_ring.c
+++ b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
@@ -897,8 +897,12 @@ static void cros_ec_sensorhub_ring_handler(struct cros_ec_sensorhub *sensorhub)
 
 		for (in = sensorhub->resp->fifo_read.data, j = 0;
 		     j < number_data; j++, in++) {
-			/* Skip event if sensor_num from EC is out of bounds. */
-			if (in->sensor_num >= sensorhub->sensor_num) {
+			/*
+			 * Skip event if sensor_num from EC is out of bounds,
+			 * unless it is a timestamp event.
+			 */
+			if (!(in->flags & MOTIONSENSE_SENSOR_FLAG_TIMESTAMP) &&
+			    in->sensor_num >= sensorhub->sensor_num) {
 				dev_warn_ratelimited(sensorhub->dev,
 						     "Invalid sensor number %u from EC\n",
 						     in->sensor_num);
-- 
2.55.0.795.g602f6c329a-goog

