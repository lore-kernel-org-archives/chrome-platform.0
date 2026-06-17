Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4708E3A0E85;
	Wed, 17 Jun 2026 05:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781674948; cv=none; b=PaH8gXLDpU0L8Us1KlwBi1Nusr83AMd2hyqmfk0IWBNsZE1q5GEd9yTw6F9FJ0+5fx83exAnANHwcx7IBvzI9o729PF0dPQGh1r9XfDyso6DTzjSJkjw4NYlMSgSiF12ZhY688xHs9bfldFArgQkOmf/dH4/ATBSgaHmzM/4ygE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781674948; c=relaxed/simple;
	bh=u6o3ctTpQ4KHgX1clYG4XK6giuzF9+sm+RZzoiUd3XA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=sEqiN529vStOayq9aLpOQ5TWGZto216dcT2KUJwlEkjaGFpfUO9CbLKiCdv5TEuE7Nat/uPpCBl8njsh1jNGwobJN3FbpHEwBqdVhs5Sim7AWB3Le8mQteiiIksFed9NlAXfRyJsni3f2JxUGMkdDdLKAQWz2S8B8mD5Y2wKxS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YBDKHKNO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YBDKHKNO"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D0997C2BCB8;
	Wed, 17 Jun 2026 05:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781674947;
	bh=u6o3ctTpQ4KHgX1clYG4XK6giuzF9+sm+RZzoiUd3XA=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=YBDKHKNOBdpkvXb4nTA5jVgFgc2sWWbTgYXF6O45XxzEBMqDUP//M9eEKAabUArY9
	 XAZ9J7m/OlRF/7jg4atvyUIsUbm9emkgg9X5asnzOCx7u4T9YqBx1AtoCLlEnkzjnv
	 HatMdWL52ifCJ7ivTiiIfVTz99QLDOjpz1WaR86zOB/xR17wpIuULRYGgN0pokTP5z
	 ViqqgHSsfHdoBdqKg4LFW7HAhic13cmfkB2dLGm3KFibSrvq7lHp6x1a6XukWR0AVi
	 wKl0jUUE1MXIFhtEB0zScL9Md5uc4AP9oMzoPYVMvMNtnXOsDZAzNAbQbQsn0kUldu
	 abIsTo7+m8q3A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B75DCD98E2;
	Wed, 17 Jun 2026 05:42:27 +0000 (UTC)
From: Bryam Vargas via B4 Relay <devnull+hexlabsecurity.proton.me@kernel.org>
Date: Wed, 17 Jun 2026 00:42:27 -0500
Subject: [PATCH v2] platform/chrome: sensorhub: bound the EC-reported
 sensor number
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-b4-disp-4e176cdc-v2-1-160f9ffa463e@proton.me>
X-B4-Tracking: v=1; b=H4sIAMIzMmoC/x3MTQqAIBBA4avErBvwD8OuEi1Mp5pNiUIE4t2Tl
 t/ivQqFMlOBeaiQ6eHC99WhxgHC6a+DkGM3KKGssHLCzWDkktCQnGyIAZ3UmoLZyCkPPUuZdn7
 /5bK29gGzF8q0YgAAAA==
To: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Guenter Roeck <groeck@chromium.org>, Gwendal Grignou <gwendal@chromium.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781674946; l=4373;
 i=hexlabsecurity@proton.me; s=proton; h=from:subject:message-id;
 bh=+D/PnruFsIeMzAqKfIW8Z1wCZ7XJX8si17RTg+XTyfE=;
 b=FOIOYxrBhzBEcf6CNQrhn1ohxz4y0fQUvz08G2DOPZLYTLxzdw9keG1oTtHFysVAPkX0yJ1Ob
 MIoskgSuBWeCG3k79OZPdOBqA3SsbLPKFN34dddN4AZHQRt8X2ewUoy
X-Developer-Key: i=hexlabsecurity@proton.me; a=ed25519;
 pk=dmppBMZNLLoPzxHi9l8tZDzEZUunPbgsYqIZYXeUrL0=
X-Endpoint-Received: by B4 Relay for hexlabsecurity@proton.me/proton with
 auth_id=814
X-Original-From: Bryam Vargas <hexlabsecurity@proton.me>
Reply-To: hexlabsecurity@proton.me

From: Bryam Vargas <hexlabsecurity@proton.me>

Each EC FIFO event carries a sensor number (in->sensor_num, an 8-bit
value). cros_ec_sensorhub_ring_handler() validates the FIFO event count,
the per-read count and the ring bound, but not the per-event sensor
number. cros_ec_sensor_ring_process_event() then uses it unchecked to
index sensorhub->batch_state[], which is allocated with only
sensorhub->sensor_num entries, so a sensor number of sensor_num or larger
is an out-of-bounds read and write of batch_state[] - in the ODR and
FLUSH paths and, via cros_ec_sensor_ring_check_for_past_timestamp(), as
an out-of-bounds read that is fed back into the event timestamp.

Validate the sensor number in the ring handler, where each event is read
from the EC, and drop a malformed event before it is used. This is the
bound cros_sensorhub_send_sample() already applies on the push path,
hoisted to the point where the EC data enters the kernel so it also
covers the batch_state[] indexing in cros_ec_sensor_ring_process_event()
and sensor_mask |= BIT(in->sensor_num) in the handler.

Fixes: 93fe48a58590 ("platform/chrome: cros_ec_sensorhub: Add median filter")
Cc: stable@vger.kernel.org
Signed-off-by: Bryam Vargas <hexlabsecurity@proton.me>
---
v2 (per Tzung-Bi Shih's review):
- Move the check from cros_ec_sensor_ring_process_event() into the FIFO
  read loop of cros_ec_sensorhub_ring_handler(), so the sensor number is
  validated where each event is read from the EC. This is the source
  Tzung-Bi pointed to and it covers every later use of the sensor number.
- Shorten the comment.
- Left the existing cros_sensorhub_send_sample() bound in place. With the
  handler check it can no longer fire, so it is now redundant; I can drop
  it as a separate cleanup patch if preferred.
- Kept Fixes: 93fe48a58590. batch_state[] and every unchecked
  batch_state[in->sensor_num]/[sensor_id] access (and sensor_mask |=
  BIT(in->sensor_num)) were introduced by the median-filter commit; at
  145d59baff59 ("Add FIFO support") there is no batch_state[] and the only
  ring-path use of the sensor number, cros_sensorhub_send_sample() ->
  push_data[], was already bounded. Both commits are in v5.7-rc1, so the
  stable backport range is unchanged either way; happy to switch to
  145d59baff59 if you prefer.

I reproduced the out-of-bounds access with an in-kernel test that drives
the batch_state[] indexing verbatim under KASAN (CONFIG_KASAN=y), plus a
userspace AddressSanitizer model of the same geometry on both 32- and
64-bit. batch_state is devm_kcalloc(sensor_num, 40 bytes); the EC FIFO
sensor number is an 8-bit field, so it can index up to 255 - roughly
9.8 KB past the end of a typical (handful-of-sensors) allocation.

  - In-kernel (7.1.0-rc5 + KASAN): an event with sensor_num just past the
    allocation tripped a slab-out-of-bounds Write in the ODR-flag path
    (batch_state[n].last_len = 0); the patched arm and an in-bounds
    control arm completed cleanly with no KASAN report.
  - ASan model (-m32 and -m64): a sensor number of 200/255 produced a
    heap-buffer-overflow WRITE 8000/10200 bytes past the alloc on both
    ABIs; the patched arm and the in-bounds arm were clean.

Reproducer (kernel module + ASan model) available on request.
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
change-id: 20260617-b4-disp-4e176cdc-9133ec4be92a

Best regards,
-- 
Bryam Vargas <hexlabsecurity@proton.me>


