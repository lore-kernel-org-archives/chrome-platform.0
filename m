Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795608806;
	b=jtdQTcS9r7AfBo+P1dndmvLE7G4z7bjh/CnVLUL7xNREtKgwOYQosPXqbYNjJEfAWm7x
	 wlAWSgB64TM8790TpC4SrtROb3ynA6mdsne//PXx5h0rxIFyUYcyEEObqU4nUx/YeEN+4
	 iRLVkH5JD62vkYrSi7QultEcIfXd4Ufe4TB3msL0kapVUaYLj2HeuxEGPMdAKufxiayUR
	 Ezh0i8n/2TP+4A9ZdDID2Dn58/N0xeEFr3jju76o4QEnHaL+5dOdaG2GFcuFSYXo7TcrS
	 G+gFqf9Aa1dxJV2up6fDt1MbKVgG/JSLs1IuTEcjfNk/md3QeknTOcGPp1EDi43GR4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795608806;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=S2gVdkGXp1tM23PpEzAGgdN0iticgUtXoYN49XssFWk=;
	b=x8QoZ0/Xgk060gcgJPOpOcSQZhinxwLoqoAmcCgZr9bwrlNqW55YhvLHLyixnVQ7ZU8q
	 VdGJudDrikt+0k0g5+9ll334f40tsiKvY7UJmSP5SldngPYXb3ybUyqdJB/WyUToJQLjy
	 gWw9UKplWhvld7yz7ITr78bCxfOtyGIw23YrnlS9xYqi7edJAykQh4tUPg8jEsTK+ttJf
	 HBmqaNKO1prlDXA9C4NCoppKo3oxkoo470lx8FNWf58i3vJrg+wwVAbWQk3r0lHFTBKZu
	 m50BXWnlPdTM3m5IHiDXQlzGtURk3YGbXehRjbxlA0Z7/ikX59nr+nxkTKbh1f8GL3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jf802LaO;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C55F606A327
	for <chrome-platform@lists.linux.dev>; Wed, 25 Nov 2026 12:13:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C55F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jf802LaO
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1b3acec6677so8399228c88.1
        for <chrome-platform@lists.linux.dev>; Wed, 25 Nov 2026 04:13:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795608805; x=1796213605; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S2gVdkGXp1tM23PpEzAGgdN0iticgUtXoYN49XssFWk=;
        b=jf802LaOAvvyl4OQZrmVff95hYWDiqI5LNGviab5tr8k5145J4+oSpfs0VQi1OdYvB
         VrNL4g9503+JU7nJvNRVCXJAuLFlyKW2mVpRLqfLCwEIUqKeba8JkNZQQODKR/WJ8Xbl
         mb1rP4bfGPUoLKyz27/WPUcd4n3vSpSSVl+Lkr5y1IaE/fYD2Nb08sY/zGborloQ6Lmq
         KsPLJW92xT9fp/v6TK3J/IhlRPOYe2p/i/4hJb1zI3jrr1wosRgH7dJIoaHIS0dBfbfL
         HqWPhNVgGqarkHwVUyLcm6H1JJheyLqoOELOKNU6SPtOywdxcUuKKnJd+7gEDObpJcqj
         s2OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795608805; x=1796213605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S2gVdkGXp1tM23PpEzAGgdN0iticgUtXoYN49XssFWk=;
        b=G1RxMmzch3cyu90+voyoHFf7Py8wwGIq+HAnjx5KPxn3B+DbXKQPpgACu196yYVNo1
         DamblJ7Y47qFF9kZ8A5HlY9ZymyJXO6w+2gvK3WiNBMkrQ/qx6s5Ew+Dx2nz69iH90B6
         GljMsXrAppQvIpg81GhdpsIyNLIMxxdQvPrgu5CRAOmjkWPjf9WWZJujuQ/YBBOBifdd
         zgMkSlaKuaBOC6R8+ZqJtlxOs7GuE8QxpXnPyrChb06knhUnesqztp37GgC7NrWMR2Yb
         PInKBjEeWEc9HELrBfSSSQWhrz/ISIWySIOu/cUmTwVlI+hGPME/tKnMHdSwk+bzsp0L
         HxaQ==
X-Forwarded-Encrypted: i=1; AL+hErEY1aKfRAw73ZmJz3t5tkvw1TUK9wxUw3Eo6qH615gEfq/YYjbJ+qGqeihQ7tNvezloSCywylHq/lNVmgnKWK8=@lists.linux.dev
X-Gm-Message-State: APuU4Z9inHBcR7CS8uW7tfxXpDgccTE8ZP6bZsQFq7kUavDB1PYF06bJ
	enJwCfZxgXjQa03GHzWbovgZLDnAhLuHlV08xkhH2/PnKIUzoF6OuCLV
X-Gm-Gg: AZFdTZeKoxCPhwbQwrMSRpli6c1GDR/7U3tWRklihuwTU070apAKfOu1ExDU1pOR+aY
	jfkQJFq2d9JHeFLmBUH1XW0tPI0XcV+lLvoSxmdw29WfbWDqtG5HOis7xVv3rQoihlnKRfTaV7S
	YeYcfGGkI2f0O3UW4XI+0XXLixI75sYiDVZbE5qhnD/1AvuSKiYETSHRtFMi1Rjk09ewKIri0Sr
	JRgfTRQHX5FzS7rL0xZ/VKjG0qOVSs9hd+yERafYIsrJZ7avmKlZU7Xoa28icrT7s8CYGJVv6zz
	2wDNot49gcOK4IA6D97dlUIe2vbWmGsBhIB/JBmvZFWLH8Xcy4RsfuES19QwxaKprs2ZetNo3QL
	HNQfkITcK618FKfURYTES0M7+zF9kMt62+2Csgr9/f+1CipJup3awQ9tXj9KZDgW59TMJfeABtJ
	aJS7aDYfYLkKssmGXDgzp8ukUnW+7IfM2dxc7l7RfN4ror7Sr4E6yfI6VGKZ6BuN/UePrJPy8KJ
	9ydXOiKx+keQ10HsPWQduE3jlTMnhuXLRMV+5El0VubB1G3TSEzD1w7Vn9sHEr5I4aWWp7+eZfF
	eel9tzTGiaqsWuJCziJhVZ9Kn17yj3qTVSsM4VS2Tx34cAP7DWmESfiOrzGNxIvkxC7/R1z89v8
	=
X-Received: by 2002:a05:7022:130d:b0:136:c443:80e5 with SMTP id a92af1059eb24-1b5568a15b7mr15255653c88.6.1795608805245;
        Wed, 25 Nov 2026 04:13:25 -0800 (PST)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5569bffd2sm39319393c88.0.2026.11.25.04.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:13:24 -0800 (PST)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>,
	Benson Leung <bleung@chromium.org>
Cc: Guenter Roeck <groeck@chromium.org>,
	Tomasz Figa <tfiga@chromium.org>,
	chrome-platform@lists.linux.dev,
	stable@vger.kernel.org
Subject: [PATCH] platform/chrome: sensorhub: Check FIFO read reply length
Date: Wed, 25 Nov 2026 20:13:21 +0800
Message-Id: <20261125121321.1603687-1-maoyixie.tju@gmail.com>
X-Mailer: git-send-email 2.34.1
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

cros_ec_sensorhub_ring_handler() processes number_data entries of the
EC reply to MOTIONSENSE_CMD_FIFO_READ. It checks number_data against the
FIFO count and the ring space, but not against the reply length.

A malfunctioning EC can send fewer entries than number_data. The loop
then uses stale bytes as samples. Past max_response bytes, it reads
beyond the message buffer.

Stop reading when the reply does not hold all number_data entries.

Found with a CodeQL-based static analysis tool that we are developing.
Reproduced in a userspace harness under AddressSanitizer. Not tested on
hardware.

Fixes: 145d59baff59 ("platform/chrome: cros_ec_sensorhub: Add FIFO support")
Cc: stable@vger.kernel.org
Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>
---
I used an LLM to help write the harness and this patch.

 drivers/platform/chrome/cros_ec_sensorhub_ring.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_sensorhub_ring.c b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
index cbaec9ff8fbd..1a4ad45ad804 100644
--- a/drivers/platform/chrome/cros_ec_sensorhub_ring.c
+++ b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
@@ -969,6 +969,13 @@ static void cros_ec_sensorhub_ring_handler(struct cros_ec_sensorhub *sensorhub)
 				 number_data, fifo_info->count - i);
 			break;
 		}
+		if (ret < struct_size(&sensorhub->resp->fifo_read, data,
+				      number_data)) {
+			dev_warn_ratelimited(sensorhub->dev,
+					     "Invalid EC data: %d entries in %d bytes\n",
+					     number_data, ret);
+			break;
+		}
 		if (out + number_data >
 		    sensorhub->ring + fifo_info->count) {
 			dev_warn(sensorhub->dev,
-- 
2.34.1

