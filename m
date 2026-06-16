Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B684C2750ED;
	Tue, 16 Jun 2026 04:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781585195; cv=none; b=uKvFLmGlHLJYyTL/PDnhVlUypHHr1gyYwPOT7p8PsktfHxSUGkDmAREtPC3loVDUUhhdgviuXTKPZLkDXL9EYEsZRST38wEeCmPJ13q3z7TY2eVaDp/Lv5GAmRPzlyxR8inxXBip5f5U17dNnQdYZPIPjQcnK4VQiDVDHKsHOf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781585195; c=relaxed/simple;
	bh=deFOUYfxP8pGaiEpSzua+BtsFALhthcEZpAm7filrBc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=XgB9w1vivcNs7iXpC+PIvv6NMWOF8IQxbW1JhjgBx0fYWipqZ7Iwce0CpbACRslKGNzGRWSkgCRhwU8GawzamlYwQsbVPxlhe4TkHvVw5XTdVIvqi/9uxm4ROd9yqoHEAJXR4zXbjzZcoXr+85MVKCxoWCzeLw9pdZ32j0zopNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sNmFciSF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sNmFciSF"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6A57AC2BCB7;
	Tue, 16 Jun 2026 04:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781585195;
	bh=deFOUYfxP8pGaiEpSzua+BtsFALhthcEZpAm7filrBc=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=sNmFciSFB/Sfa4Drrk02cW11wo/Pz0BuHJJUkrT95Szl82bqw4NBXcJ6/P0RGcKCw
	 1/CO1ePX7SjV5iFwfLN4+hpNv5a+aLtOVvt3tSlsNi54ptBw3lr0rMZG5OmdiTkXsG
	 OLgSyOoP4ZyUAwf3fIx37VUN3/IU9kt+2DYP+fWimKkdhHqL6tXz7Pr9QedtObH6SR
	 v6pXtbyVszJOkSYFMmmZKLNHncWKcffPUZRQcTDwkZBfm1+M1Xy8bronEv46DFdrDX
	 vbWsaYJAaJd+hgpFs6ZsYxe7BT8BEtufXtZoIFbNJ2ZlHX6vTdDcEEySLMEK/xdjce
	 akujpkRzv5ftQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EDB6CD98CE;
	Tue, 16 Jun 2026 04:46:35 +0000 (UTC)
From: Bryam Vargas via B4 Relay <devnull+hexlabsecurity.proton.me@kernel.org>
Date: Mon, 15 Jun 2026 23:46:34 -0500
Subject: [PATCH] platform/chrome: sensorhub: bound the EC-reported sensor
 number
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-b4-disp-42d17651-v1-1-fe599bb972f4@proton.me>
X-B4-Tracking: v=1; b=H4sIACnVMGoC/x3MQQqAIBBA0avErBtQsxG6SrSwnGo2JgoRSHdPW
 r7F/xUKZ+ECU1ch8y1Frtig+w6208eDUUIzGGVIkR5xtRikJLQmaEejxkA87OQcKW+hZSnzLs+
 /nJf3/QDc3r64YgAAAA==
To: Tzung-Bi Shih <tzungbi@kernel.org>, Benson Leung <bleung@chromium.org>
Cc: Gwendal Grignou <gwendal@chromium.org>, chrome-platform@lists.linux.dev, 
 Guenter Roeck <groeck@chromium.org>, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781585193; l=3746;
 i=hexlabsecurity@proton.me; s=proton; h=from:subject:message-id;
 bh=8SrA15YJrZtNHL8+1PqoW54xiLZumanmBmpsTVz+v0s=;
 b=CdLfdDXQNhI8VmZ3p6cKWXt2n7C6j36ikhmenIjuZ4z9oxgt2hHywakPWYjElJgQRi9Whp2MB
 I50M2v841jjC+iYn33MXpyhwovWC2GvknVGafV+eC8xoLCq09RUS7Vs
X-Developer-Key: i=hexlabsecurity@proton.me; a=ed25519;
 pk=dmppBMZNLLoPzxHi9l8tZDzEZUunPbgsYqIZYXeUrL0=
X-Endpoint-Received: by B4 Relay for hexlabsecurity@proton.me/proton with
 auth_id=814
X-Original-From: Bryam Vargas <hexlabsecurity@proton.me>
Reply-To: hexlabsecurity@proton.me

From: Bryam Vargas <hexlabsecurity@proton.me>

cros_ec_sensor_ring_process_event() takes the sensor number from each
EC FIFO event (in->sensor_num, an 8-bit value) and uses it unchecked to
index sensorhub->batch_state[], which is allocated with only
sensorhub->sensor_num entries (the EC-reported sensor count).
cros_ec_sensorhub_ring_handler() validates the FIFO event count and the
ring bound, but not the per-event sensor number, so a value of
sensor_num or larger results in an out-of-bounds read and write of the
batch_state array - directly here and, via
cros_ec_sensor_ring_check_for_past_timestamp(), as an out-of-bounds read
that is fed back into the event timestamp.

The push path cros_sensorhub_send_sample() already rejects a sensor
number that is not smaller than sensor_num; apply the same check in the
ring processing path and drop the malformed event.

Fixes: 93fe48a58590 ("platform/chrome: cros_ec_sensorhub: Add median filter")
Cc: stable@vger.kernel.org
Signed-off-by: Bryam Vargas <hexlabsecurity@proton.me>
---
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

The fix is the same bound cros_sensorhub_send_sample() already applies,
moved to the per-event chokepoint so it also covers the timestamp-spread
read path. A malicious, malfunctioning or counterfeit EC (or an attacker
interposing on the AP<->EC bus) is the source; this is a hardening of the
kernel's trust in the EC FIFO, in the spirit of the existing check.

Reproducer (kernel module + ASan model) available on request.
---
 drivers/platform/chrome/cros_ec_sensorhub_ring.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_sensorhub_ring.c b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
index a10579144c34..a06609bca57b 100644
--- a/drivers/platform/chrome/cros_ec_sensorhub_ring.c
+++ b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
@@ -436,6 +436,20 @@ cros_ec_sensor_ring_process_event(struct cros_ec_sensorhub *sensorhub,
 	const s64 now = cros_ec_get_time_ns();
 	int axis, async_flags;
 
+	/*
+	 * The sensor number is reported by the EC and is used unchecked below
+	 * to index sensorhub->batch_state[], which is only sensor_num entries
+	 * long. Reject an out-of-range value, as cros_sensorhub_send_sample()
+	 * already does, so a malformed FIFO event cannot drive an out-of-bounds
+	 * access.
+	 */
+	if (in->sensor_num >= sensorhub->sensor_num) {
+		dev_warn_ratelimited(sensorhub->dev,
+				     "Invalid sensor number %u from EC\n",
+				     in->sensor_num);
+		return false;
+	}
+
 	/* Do not populate the filter based on asynchronous events. */
 	async_flags = in->flags &
 		(MOTIONSENSE_SENSOR_FLAG_ODR | MOTIONSENSE_SENSOR_FLAG_FLUSH);

---
base-commit: 8e65320d91cdc3b241d4b94855c88459b91abf66
change-id: 20260615-b4-disp-42d17651-d6e3f67760a4

Best regards,
-- 
Bryam Vargas <hexlabsecurity@proton.me>


