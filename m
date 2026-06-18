Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931C9EED8;
	Thu, 18 Jun 2026 05:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781761589; cv=none; b=dBEa2JFCUHFja9QVTFwx/+sjtGLQl6jLvGKBIo9aVjwVBPd/Fvn0cvlF+cj28n9fTnhSQuxFI0EmAcec9Izl0TSph33wEum4qpLPVwGZ0oYmA5ePvrbq97ID252977JSH6cDppmF21Udf++kaZGEyFK47loHcknWIg6KOyfNKzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781761589; c=relaxed/simple;
	bh=YSTczGwxYr9KyveovZCitgFz9bhQfVOBBKddJI7TzAo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=udlVoxuZPIJmKxd3DE3fc/qQmqYBvzdujvzLXxy5rzNPN8CuG3UH3h1vqCyX/TWbP9QF/ZplSt3ZZdSPRcqC9NcenO/u/p56vDUfYb/fRhlwPJ8iqquJyekRjlMV3WOx0FxNKMtCSaXLaOl+uY8d5/2Z2GbVaTwrKNbJcbwtODQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rNrNrJRB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rNrNrJRB"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1E9DCC2BCB0;
	Thu, 18 Jun 2026 05:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781761589;
	bh=YSTczGwxYr9KyveovZCitgFz9bhQfVOBBKddJI7TzAo=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=rNrNrJRB5PLihArtwkm2EkFPWOng+o9IrJfLGRfxQjvaSbjDxKOifLft0ll2StNHd
	 oNctQj+ebNR0Z9+p2/NDJN3aCq+787m/E/vd5SN/DDPm/o+A38lUJ0kSseIHJA6JFk
	 Bnc2zZ1pZzXbgiZY5kUvqAZlQhltYUK0bStWhtiEyDMIXOpp+Pf/5OcBODvj9rr5AR
	 4paudJ8NNt7Wg4qqGsUr+0U4XNOm8j/+DMHokHfjKsiPbIAV0z+moZxQdg6y+fAtDL
	 xhlYTrcTmbVZPzycqU0u0EUwDn9F8Dr8eSGCXZD81K5KiyaHGZhLMyosPPUtSPlWk1
	 Twosy6fQF360Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDB8ACD98F2;
	Thu, 18 Jun 2026 05:46:28 +0000 (UTC)
From: Bryam Vargas via B4 Relay <devnull+hexlabsecurity.proton.me@kernel.org>
Date: Thu, 18 Jun 2026 00:46:28 -0500
Subject: [PATCH v3] platform/chrome: sensorhub: bound the EC-reported
 sensor number
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-b4-disp-adb3f790-v3-1-3a164ed63cbd@proton.me>
X-B4-Tracking: v=1; b=H4sIADOGM2oC/x3MTQqAIBBA4avErBsw+7OuEi1Mx5qNhQMRSHdPW
 n6L9zIIJSaBucqQ6GbhMxa0dQXusHEnZF8MWulBDY3BrUPPcqH1WxvGSaENjTaOpp56ByW7EgV
 +/uWyvu8HKJG7X2IAAAA=
To: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>
Cc: chrome-platform@lists.linux.dev, Guenter Roeck <groeck@chromium.org>, 
 Gwendal Grignou <gwendal@chromium.org>, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781761587; l=2341;
 i=hexlabsecurity@proton.me; s=proton; h=from:subject:message-id;
 bh=kRkQQ2XtenLBQgIAfyc88UeRnsxPWIzaMvsDGjnhD3I=;
 b=oJcZC6eYCe5So+WpqJwGJnz45a8YJVhOj88O65r6GJWx07CRPjNdU8btfNh7r1C08KxpZZgR5
 BP9AaT4x/K0BLmGp5nObPRp632D3j1B0+u4AOUyFklVDXWQbbrH8AFG
X-Developer-Key: i=hexlabsecurity@proton.me; a=ed25519;
 pk=dmppBMZNLLoPzxHi9l8tZDzEZUunPbgsYqIZYXeUrL0=
X-Endpoint-Received: by B4 Relay for hexlabsecurity@proton.me/proton with
 auth_id=814
X-Original-From: Bryam Vargas <hexlabsecurity@proton.me>
Reply-To: hexlabsecurity@proton.me

From: Bryam Vargas <hexlabsecurity@proton.me>

Each EC FIFO event carries an 8-bit sensor number (in->sensor_num).
cros_ec_sensorhub_ring_handler() validates the FIFO event count, the
per-read count and the ring bound, but not the sensor number, which
cros_ec_sensor_ring_process_event() then uses unchecked to index
sensorhub->batch_state[] - allocated with only sensorhub->sensor_num
entries. A sensor number of sensor_num or larger is an out-of-bounds
read and write of batch_state[].

Validate the sensor number in the ring handler, where each event is read
from the EC, and drop a malformed event before it is used.

Fixes: 145d59baff59 ("platform/chrome: cros_ec_sensorhub: Add FIFO support")
Cc: stable@vger.kernel.org
Signed-off-by: Bryam Vargas <hexlabsecurity@proton.me>
Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
v3 (per Tzung-Bi Shih's review):
- Fixes: -> 145d59baff59 ("Add FIFO support") as requested.
- Added Tzung-Bi's Reviewed-by.
- Trimmed the commit message.
No code change from v2 (single bound in the FIFO read loop).

The out-of-bounds write was reproduced under KASAN with an in-kernel test
driving the batch_state[] indexing, plus a 32/64-bit AddressSanitizer
model of the same geometry; reproducer available on request.
---
 drivers/platform/chrome/cros_ec_sensorhub_ring.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_sensorhub_ring.c b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
index a10579144c34..64e9615ed6f4 100644
--- a/drivers/platform/chrome/cros_ec_sensorhub_ring.c
+++ b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
@@ -890,6 +890,14 @@ static void cros_ec_sensorhub_ring_handler(struct cros_ec_sensorhub *sensorhub)
 
 		for (in = sensorhub->resp->fifo_read.data, j = 0;
 		     j < number_data; j++, in++) {
+			/* Skip event if sensor_num from EC is out of bounds. */
+			if (in->sensor_num >= sensorhub->sensor_num) {
+				dev_warn_ratelimited(sensorhub->dev,
+						     "Invalid sensor number %u from EC\n",
+						     in->sensor_num);
+				continue;
+			}
+
 			if (cros_ec_sensor_ring_process_event(
 						sensorhub, fifo_info,
 						fifo_timestamp,

---
base-commit: 8e65320d91cdc3b241d4b94855c88459b91abf66
change-id: 20260618-b4-disp-adb3f790-af128ce95e5c

Best regards,
-- 
Bryam Vargas <hexlabsecurity@proton.me>


