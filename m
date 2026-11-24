Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795508488;
	b=CQ9Iv/q/GzlaTKpWm0hWwV/V1+0fIghz2wYdYOYo4q6VKMIV2804u0Iep0ID7ZLu630f
	 FqqP4hPW4FMqKmcW/cEvIKP1Qff/60UclH5LAVHUIqesPD+tJUF7i3mLPo6Dwwj1J3Wdw
	 YbK4ctS1PQEYmbIx8kXuWln+JbQ3VSCKVSqOI4lBPfZlc26L977YdiaPiTyxJtPuaWuJe
	 +onKhYIbKJTbtKt1uY0TViX9ssAeP+Jyf6AnjVpaRZx4q4dNhgscEKTHbuSaZi5c7d4nU
	 w6PxFh1seicZJ5ShENLyZ6jAu7uTxSsnSxFw71RWFDuamav+f26H9usW4xH7QZ5Io1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795508488;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=ootECmzeKa6bRpN1cz+4ACBfuSaEob69kCPOZCISDTA=;
	b=DIns8lQVMDgPNDmVvNhEAfWZksd8WQGPzEV4TvgMgIRfUnzhkUS+6rxBf5q4nr7vbZg4
	 1AwU+QGq0Isn7T3pzDMXOVGJ2INak3qYSw8Lqm0yyjFvWG3sKwlqifTJ3miaQaDkGn7Sp
	 5ghiLMd5njqFZysu/JGEw4vXCrwi7gzZ1DUQcwsMBBm98V4NDhGANXE+JW2vqwmaymI9a
	 LHhU4aEECqYX8UIh90srxDngOBe5JgtzaVCu/lty59Y5l/BiqMwjwka97qmWNCkJoZIcw
	 LDJ7R6VGN+MskVgK5PVVcYhWOXBRDf4Mi5mGPj0t8UWMS2yAMsnRws126eNzuoIgHRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="C/7rt0JO";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55440606A31E
	for <chrome-platform@lists.linux.dev>; Tue, 24 Nov 2026 08:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C/7rt0JO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 782501F000E0;
	Tue, 24 Nov 2026 08:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795508488;
	bh=ootECmzeKa6bRpN1cz+4ACBfuSaEob69kCPOZCISDTA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=C/7rt0JO+4D0rxNnKwlu5E+D4yoGkv04xLPs/NB7YsjvrE5Hn56B2HiP21qQxXcbT
	 MiBrAl//PZORt3Igo1fixKDkVZNf+53fCyqQ1LWcvwcPzLNo3SuLZfubFYaK6S9sXw
	 7KG9GX2D2Ghow4g0SCmG+4tTqKgAdv/Z9N656Ka77wilVOdtVvXq892T08KuKXabOa
	 SD8wSpFCbvVtJTrqhwEwY7LQUe7X9/tmLYvLgwSPakrpRXAlbhtZyqpLo0ys42EHcu
	 1kF0PS6Q6QBwyNACIr6kyUCllqNlG0A7AYsBF2ySFrKm9yevokybMhFPYPSOpslNLQ
	 ccqPEqR+kN7sA==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Benson Leung <bleung@chromium.org>
Cc: tzungbi@kernel.org,
	chrome-platform@lists.linux.dev
Subject: [PATCH 4/9] platform/chrome: cros_ec_proto: Reallocate din/dout buffers atomically
Date: Tue, 24 Nov 2026 08:21:07 +0000
Message-ID: <20261124082112.3361229-5-tzungbi@kernel.org>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
In-Reply-To: <20261124082112.3361229-1-tzungbi@kernel.org>
References: <20261124082112.3361229-1-tzungbi@kernel.org>
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Post: <mailto:chrome-platform@lists.linux.dev>
List-Help: <mailto:chrome-platform+help@lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
List-Owner: <mailto:chrome-platform+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In cros_ec_query_all(), cros_ec_get_proto_info() for EC_INDEX updated
`din_size` and `dout_size` before really reallocating `din` and `dout`,
while the subsequent PD_INDEX query sent another EC command in between.
Transport drivers that bounds-check against `din_size`/`dout_size` could
therefore access `din`/`dout` out of bounds.

In addition, cros_ec_query_all() freed `din` and `dout` before
allocating the new buffers, leaving dangling pointers on -ENOMEM and
needlessly reallocating on runtime re-queries even when buffer sizes did
not grow.

Use devm_krealloc() to update `din`/`din_size` and `dout`/`dout_size`
directly in cros_ec_get_proto_info() and
cros_ec_get_proto_info_legacy(), before updating the other protocol
fields.

Fixes: 2c7589af3c4d ("mfd: cros_ec: add proto v3 skeleton")
Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 drivers/platform/chrome/cros_ec_proto.c | 58 ++++++++++++++-----------
 1 file changed, 32 insertions(+), 26 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
index 135134a1e317..d48d3c73ca0b 100644
--- a/drivers/platform/chrome/cros_ec_proto.c
+++ b/drivers/platform/chrome/cros_ec_proto.c
@@ -385,7 +385,8 @@ static int cros_ec_get_proto_info(struct cros_ec_device *ec_dev, int devidx)
 {
 	struct cros_ec_command *msg;
 	struct ec_response_get_protocol_info *info;
-	int ret, mapped;
+	int ret, mapped, din_size, dout_size;
+	u8 *din, *dout;
 
 	ec_dev->proto_version = 3;
 	if (devidx > 0)
@@ -422,14 +423,27 @@ static int cros_ec_get_proto_info(struct cros_ec_device *ec_dev, int devidx)
 
 	switch (devidx) {
 	case CROS_EC_DEV_EC_INDEX:
+		ret = -ENOMEM;
+		din_size = info->max_response_packet_size + EC_MAX_RESPONSE_OVERHEAD;
+		din = devm_krealloc(ec_dev->dev, ec_dev->din, din_size, GFP_KERNEL);
+		if (!din)
+			goto exit;
+		ec_dev->din_size = din_size;
+		ec_dev->din = din;
+
+		dout_size = info->max_request_packet_size + EC_MAX_REQUEST_OVERHEAD;
+		dout = devm_krealloc(ec_dev->dev, ec_dev->dout, dout_size, GFP_KERNEL);
+		if (!dout)
+			goto exit;
+		ec_dev->dout_size = dout_size;
+		ec_dev->dout = dout;
+
 		ec_dev->max_request = info->max_request_packet_size -
 						sizeof(struct ec_host_request);
 		ec_dev->max_response = info->max_response_packet_size -
 						sizeof(struct ec_host_response);
 		ec_dev->proto_version = min(EC_HOST_REQUEST_VERSION,
 					    fls(info->protocol_versions) - 1);
-		ec_dev->din_size = info->max_response_packet_size + EC_MAX_RESPONSE_OVERHEAD;
-		ec_dev->dout_size = info->max_request_packet_size + EC_MAX_REQUEST_OVERHEAD;
 
 		dev_dbg(ec_dev->dev, "using proto v%u\n", ec_dev->proto_version);
 		break;
@@ -456,6 +470,7 @@ static int cros_ec_get_proto_info_legacy(struct cros_ec_device *ec_dev)
 	struct ec_params_hello *params;
 	struct ec_response_hello *response;
 	int ret, mapped;
+	u8 *din, *dout;
 
 	ec_dev->proto_version = 2;
 
@@ -497,12 +512,23 @@ static int cros_ec_get_proto_info_legacy(struct cros_ec_device *ec_dev)
 		goto exit;
 	}
 
+	ret = -ENOMEM;
+	din = devm_krealloc(ec_dev->dev, ec_dev->din, EC_PROTO2_MSG_BYTES, GFP_KERNEL);
+	if (!din)
+		goto exit;
+	ec_dev->din_size = EC_PROTO2_MSG_BYTES;
+	ec_dev->din = din;
+
+	dout = devm_krealloc(ec_dev->dev, ec_dev->dout, EC_PROTO2_MSG_BYTES, GFP_KERNEL);
+	if (!dout)
+		goto exit;
+	ec_dev->dout_size = EC_PROTO2_MSG_BYTES;
+	ec_dev->dout = dout;
+
 	ec_dev->max_request = EC_PROTO2_MAX_PARAM_SIZE;
 	ec_dev->max_response = EC_PROTO2_MAX_PARAM_SIZE;
 	ec_dev->max_passthru = 0;
 	ec_dev->pkt_xfer = NULL;
-	ec_dev->din_size = EC_PROTO2_MSG_BYTES;
-	ec_dev->dout_size = EC_PROTO2_MSG_BYTES;
 
 	dev_dbg(ec_dev->dev, "falling back to proto v2\n");
 	ret = 0;
@@ -578,7 +604,6 @@ static int cros_ec_get_host_command_version_mask(struct cros_ec_device *ec_dev,
  */
 int cros_ec_query_all(struct cros_ec_device *ec_dev)
 {
-	struct device *dev = ec_dev->dev;
 	u32 ver_mask;
 	int ret;
 
@@ -601,22 +626,6 @@ int cros_ec_query_all(struct cros_ec_device *ec_dev)
 		}
 	}
 
-	devm_kfree(dev, ec_dev->din);
-	devm_kfree(dev, ec_dev->dout);
-
-	ec_dev->din = devm_kzalloc(dev, ec_dev->din_size, GFP_KERNEL);
-	if (!ec_dev->din) {
-		ret = -ENOMEM;
-		goto exit;
-	}
-
-	ec_dev->dout = devm_kzalloc(dev, ec_dev->dout_size, GFP_KERNEL);
-	if (!ec_dev->dout) {
-		devm_kfree(dev, ec_dev->din);
-		ret = -ENOMEM;
-		goto exit;
-	}
-
 	/* Probe if MKBP event is supported */
 	ret = cros_ec_get_host_command_version_mask(ec_dev, EC_CMD_GET_NEXT_EVENT, &ver_mask);
 	if (ret < 0 || ver_mask == 0) {
@@ -660,10 +669,7 @@ int cros_ec_query_all(struct cros_ec_device *ec_dev)
 				"failed to retrieve wake mask: %d\n", ret);
 	}
 
-	ret = 0;
-
-exit:
-	return ret;
+	return 0;
 }
 EXPORT_SYMBOL(cros_ec_query_all);
 
-- 
2.56.1.831.g720f3f5937-goog

