Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795508489;
	b=kz+LHxyXK/7ukYlTmehyapMGXGD6Kr4PtGwrwMJXUvduERcw9Q4mRSX5vSujnBweatKy
	 zagNUNQUcYl7uQyyUpZ4G2q6oG29a2oe1/lz5z7fOXT39W85FFZfFUFRCNJL21VlRFKfJ
	 +p1OQcsauo9kY4sFwnL9ZL4yYNl4VZCwgYT6KS33i9CaijN8bIyclr1QTfPrAlKnv2ZVR
	 uPXhsIrkbw3fG1oVtUAbpT6vu1YJX66gvF6aakpDY5vf3creFPv/SW9QGU+ZredkRWu5o
	 NnXzXW1FgllT4hb3hqebUoSZbxW4+ioWsAiOJPZk4rudqZbByN8gBpkLTaC4FmTx3aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795508489;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=/NtzFHlsvtt/l/0IpJTB8NYw0J/0nnB82oUsBNzIeA0=;
	b=jlt90U1IY4mJ2a3ACG3Tje9LVXv1e0+saQfwO+AK5D4e1e+0Tu3Y+Gw3yOB9q+btdtZN
	 IRrjOZY2HewQ6F9UyURF7/dqbU+ZNs6SFJ+BPjEqT/3FgXW9K2Vg43XiOwkzFfigvYLUh
	 KpQKlgUo5u6VbW4n5HBs+BT3H90+KkTyILK6GiUEJjhDbmx8IPBZpb4o9uBC9X4BWRKpE
	 A1xA7zeu/uLZJLDUkTEZazTmzBLA583TpNDukfd7O6uetIOgh6ugOv3tlemfIykOzHtbD
	 H1Xv/WVekk60jxiVASiCZ4AOv6iC5FpDaE+uObjG/a3TQeBWDkAsFXV5UoAYM8P7PpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jPua99cV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6808606A31E
	for <chrome-platform@lists.linux.dev>; Tue, 24 Nov 2026 08:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jPua99cV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 085481F000D2;
	Tue, 24 Nov 2026 08:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795508489;
	bh=/NtzFHlsvtt/l/0IpJTB8NYw0J/0nnB82oUsBNzIeA0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jPua99cVsMD622GWM+n8obR5Rz+NsghGS+5kijofcsy4CUAGIkkr3hwHonWwSSKC1
	 P5/vx681mVmzRuHdSDHfD5lhG50IXDn5X2xlw1kZGTxMuoLVL6is3tb/1P+7EhwCh6
	 ZVustC8QmPaXURunsC8n7TLWgKwORJqWbl388LpFKmNO519S/rdcoYk67XEQ5eApC4
	 gBA5gIK9U4DPsBTt9n2EpO0WlX+NgtijxJSgZ8xpYUrngr7TJvCrBN093lf47UQiGm
	 LdZ3ClPd/5sKrjNiNe+vG+/M1Y9qLa9VF5opide/7vIy6UTiJAMRMRtw8RpPB/X5+Q
	 r7EW2QUMa9JYA==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Benson Leung <bleung@chromium.org>
Cc: tzungbi@kernel.org,
	chrome-platform@lists.linux.dev
Subject: [PATCH 5/9] platform/chrome: cros_ec_proto: Guard protocol v2 fallback
Date: Tue, 24 Nov 2026 08:21:08 +0000
Message-ID: <20261124082112.3361229-6-tzungbi@kernel.org>
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

cros_ec_query_all() falls back to cros_ec_get_proto_info_legacy()
whenever cros_ec_get_proto_info() returned any error.  Because
cros_ec_get_proto_info_legacy() clears `ec_dev->pkt_xfer`, a transient
failure during initial probe or a runtime re-query can permanently
downgrade a v3 EC to v2, or mask the real error with -EIO on v3-only
transports without `cmd_xfer`.

Add cros_ec_proto_can_fallback_to_v2() to avoid falling back when:
- The device is already registered with `pkt_xfer` (known v3+ EC).
- `ec_dev->cmd_xfer` is not supported (doesn't support v2).
- The v3 query failed with a transient error (-ENOMEM or -EAGAIN).

Also skip the v3 probe and call cros_ec_get_proto_info_legacy() directly
when `ec_dev->pkt_xfer` is already NULL (known v2-only EC).

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 drivers/platform/chrome/cros_ec_proto.c | 55 ++++++++++++++++++-------
 1 file changed, 40 insertions(+), 15 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
index d48d3c73ca0b..d8ab82154c92 100644
--- a/drivers/platform/chrome/cros_ec_proto.c
+++ b/drivers/platform/chrome/cros_ec_proto.c
@@ -595,6 +595,24 @@ static int cros_ec_get_host_command_version_mask(struct cros_ec_device *ec_dev,
 	return ret;
 }
 
+static bool cros_ec_proto_can_fallback_to_v2(struct cros_ec_device *ec_dev,
+					     int ret)
+{
+	/* The EC does support v3. */
+	if (ec_dev->registered && ec_dev->pkt_xfer)
+		return false;
+
+	/* The transport doesn't support v2. */
+	if (!ec_dev->cmd_xfer)
+		return false;
+
+	/* The system or EC is encountering transient failures. */
+	if (ret == -ENOMEM || ret == -EAGAIN)
+		return false;
+
+	return true;
+}
+
 /**
  * cros_ec_query_all() -  Query the protocol version supported by the
  *         ChromeOS EC.
@@ -607,23 +625,30 @@ int cros_ec_query_all(struct cros_ec_device *ec_dev)
 	u32 ver_mask;
 	int ret;
 
-	/* First try sending with proto v3. */
-	if (!cros_ec_get_proto_info(ec_dev, CROS_EC_DEV_EC_INDEX)) {
-		/* Check for PD. */
-		cros_ec_get_proto_info(ec_dev, CROS_EC_DEV_PD_INDEX);
+	if (ec_dev->pkt_xfer) {
+		/* First try sending with proto v3. */
+		ret = cros_ec_get_proto_info(ec_dev, CROS_EC_DEV_EC_INDEX);
+
+		if (!ret) {
+			/* Check for optional PD chip; ignore errors. */
+			cros_ec_get_proto_info(ec_dev, CROS_EC_DEV_PD_INDEX);
+		} else if (cros_ec_proto_can_fallback_to_v2(ec_dev, ret)) {
+			/* Fall back to querying with a v2 hello message. */
+			ret = cros_ec_get_proto_info_legacy(ec_dev);
+		}
 	} else {
-		/* Try querying with a v2 hello message. */
+		/* pkt_xfer is NULL (v2-only EC); query with v2 directly. */
 		ret = cros_ec_get_proto_info_legacy(ec_dev);
-		if (ret) {
-			/*
-			 * It's possible for a test to occur too early when
-			 * the EC isn't listening. If this happens, we'll
-			 * test later when the first command is run.
-			 */
-			ec_dev->proto_version = EC_PROTO_VERSION_UNKNOWN;
-			dev_dbg(ec_dev->dev, "EC query failed: %d\n", ret);
-			return ret;
-		}
+	}
+	if (ret) {
+		/*
+		 * It's possible for a test to occur too early when
+		 * the EC isn't listening. If this happens, we'll
+		 * test later when the first command is run.
+		 */
+		ec_dev->proto_version = EC_PROTO_VERSION_UNKNOWN;
+		dev_dbg(ec_dev->dev, "EC query failed: %d\n", ret);
+		return ret;
 	}
 
 	/* Probe if MKBP event is supported */
-- 
2.56.1.831.g720f3f5937-goog

