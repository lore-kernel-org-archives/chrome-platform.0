Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794996961;
	b=s7OSw9KDBn+2kxYd2KI3EprAtucKtAzBvS8kQQfarH3ByrVDzp5S/vNlT1B3ZjyxaLwk
	 aSWX0OwA0CHIft8dWQ6lX23Mg1ngI3ZOAr2goU4FLBtIPed+sPx5oiVbxDJjXKDXv9Opz
	 YBkRmHsmXLHsVXU2err5lXiqAIOxualIg77wcShLqt228uvdhJ2jGCC45nmGOQSiUTbsf
	 mAVU7sT7NpKhnz5JsLtQAPP5+CAeJjOh2FVhnk2xxcTV8p+usFsBmUwwRkYS9LxdG8kjf
	 AjYNvY+0yIk7qJ6+UX6MqKCO6d08zhh6J3b1Cj4rb2ZlvJfYi6WZTupvNbkkGGHJF/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794996961;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Fv3I+O9hDJ9zZ0P3XgSXSVC2IJuf4Bq4HQpsFJCZlL8=;
	b=MQ2liPQLbPf6XfrjX4Qx9aeLZMTcTfEU/gJiAiDYXPPEt6Uw966Hc+aL8u4KZozFUMnb
	 M4yzlJO7P06pm9qBvc9qSv1kEceOanbQMGIM5yKTh9HRHbIjVMJmbcpPO60JPMJdfIp+J
	 EoWEMe0dBg/UIwD6Gii8GdSVCjAJArUlQWnmy//dbaLG0XuQARWilcbgFiSGv21MrknfF
	 EV8fqcKiH7OCp5EzH+W6mFle+1fS98LmqAkvNYgDFb+O/nw4l9NwZsVXo9NfYiP+DRoXy
	 U92B2IExjlySgFBDS9Gyn6IqPc41rdUfDJ9D5JKxMJ0vsgFPysTFGTnrkWxxCdr6lGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B5+5VUaO;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4034606A325
	for <chrome-platform@lists.linux.dev>; Wed, 18 Nov 2026 10:16:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4034606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B5+5VUaO
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2f00fc215f9so247425ad.0
        for <chrome-platform@lists.linux.dev>; Wed, 18 Nov 2026 02:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794996960; x=1795601760; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fv3I+O9hDJ9zZ0P3XgSXSVC2IJuf4Bq4HQpsFJCZlL8=;
        b=B5+5VUaODMmnL/TPKiM0CtpK3qZBBWZu8aX7FtzZSMbyLlIXuKs6y38AyHSTS/IwoT
         +DPf2Rq0umdjxS1pcg0xL4OiFJrxuk6p1CkF0r2mV1HC4WBcfQ0hHOwvu0fvPUNN2gt7
         43vdEMe0zaokipKmgHPIZMDITgAfouuB2bO9ktFGQOfUH6Yddis9GDpk8Iq/cD6PqyWZ
         JO2Q2xzGc5svr+Ycz1WGjPqbyrrJn5PMJNtemuRGv0+14mAmL/fJzWWi7oEb4+Oho0ta
         apummDVze7VUSLhB18y44WoLSNIYs57iRHeRyxNCt0Uo8C7KGTg7dH7CnQPBGlFBZjVP
         cBNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794996960; x=1795601760;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fv3I+O9hDJ9zZ0P3XgSXSVC2IJuf4Bq4HQpsFJCZlL8=;
        b=uRewgaE6lG1CaQiEqxRYrR6tTI2kdftUwPYTyYU2QfVHTKvBGKpbpdNrcB7pALnX0Z
         ZEHUaxFjMnoST3yMDDwvvnIqgvtrM9+Y8TdZ0nW01O8mpxguhQqYIg//XpScp7Xj9jGb
         5UC5zwbHf1ySilup/aIuEq8ClsbKxTo4z+taYSvL5SjAKq82T63eUHTHf8JNk5XDzFQM
         pKHd6zGZMxmdWW5YFPziArtnJybh/WrceDhqgBnTo3u8mwlmsMUot3hoR/2eQsGdUeLg
         mUdIKllvvfQgLo8QL1zuyQPR/o6NEpiupEFoT8jk+QpVXyDg1ukhkz3we8zpDULnNI2x
         Y0YA==
X-Gm-Message-State: APuU4Z/NZoyRQ4y9jR0i3svOjfraOdgx02cSD2Mh+ywYOlXGaX2tHzq4
	8bVqFUOIvdsfHLVauhz9ipFIlnjOZjQHZFfqSr4TMrkRRwb16r2moFL3
X-Gm-Gg: AZFdTZcoDBiMXirKjRfuSWhatIlyrQFA9z8pIhANYTm/N+X4jb0ybhUuUhpXx8Y+N9E
	CMn1LohT9x4wnSX6HWgaGpSr6rgALTS2wpicRFHAsG2ambGvLM4EFwDmhsnU+Ji/EgCpUXCknLM
	RDWAu0gt6dTomn2HR9QAEnoQGmely2/QP86zchRWSM1WOSwdnvOJH4VKYl91tQXym6JqRcodIM1
	ttJ/jwS/xdBG8CB/eUsFxtDm0grKe1LO6E8QYSmbBCwyhJ4uAlGErAx+JYdKY/s2GuNBHt/7b/f
	10u+iEkcbzvYTF9LglRaMY1+Oi3LZFzbl/20VlCDWHXOdb1oxp0OrI0kwEsD8BWebQVhFjdS1dr
	z7E7dLVNTR35EHHUF9+mFz4gK3A6Foq9G2ibsfAmk5U2qI5vlsAUJDBpuZ2jsXl4H+AcowD3Jdg
	X5fRLm3uS2bxnJF3/ORIpR8B8IHUSYDYjutk8BuhmQey5OUF2YLVoFUdhEkBwLsiN8N1CN3k0+V
	A+x+iGPzuR4ycBO9ICaHNJ6ATklSEQjywaJ1dDF7MfIVptcfAymoEXQ7C/Es5GKegDczeeN0ek4
	UPE/kilJuLlFyOl2VFYuOSAgZ7y/nIk80aO5bwgTWs1bclnXKWmsWw==
X-Received: by 2002:a17:903:234c:b0:2ef:e28e:8f17 with SMTP id d9443c01a7336-2eff754459dmr21917045ad.49.1794996959717;
        Wed, 18 Nov 2026 02:15:59 -0800 (PST)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff623c968sm10954285ad.55.2026.11.18.02.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 02:15:59 -0800 (PST)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>,
	Benson Leung <bleung@chromium.org>
Cc: chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] platform/chrome: wilco_ec: Reject out-of-bounds property length
Date: Wed, 18 Nov 2026 18:15:55 +0800
Message-Id: <20261118101555.3467162-1-maoyixie.tju@gmail.com>
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

wilco_ec_get_property() copies rs.length bytes from rs.data into
prop_msg->data without checking rs.length, which comes from the EC.
Both buffers hold WILCO_EC_PROPERTY_MAX_SIZE (4) bytes, so a larger
length reads past rs on the stack and writes past the caller's message.

Return -EBADMSG for such a length, as the file does for other bad
responses.

Found with a CodeQL-based static analysis tool that we are developing.
I used an LLM to help write this patch and a userspace harness. The
harness runs the unmodified properties.c against a model of the EC
under AddressSanitizer. It reports the copy for lengths 5 to 255, and
nothing with this patch. Not tested on hardware, only compile-tested
with W=1.

Fixes: 0c0b7ea23aed ("platform/chrome: wilco_ec: Add property helper library")
Cc: stable@vger.kernel.org
Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>
---
 drivers/platform/chrome/wilco_ec/properties.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/chrome/wilco_ec/properties.c b/drivers/platform/chrome/wilco_ec/properties.c
index 9951c8db04da065..4ca7e874804c28e 100644
--- a/drivers/platform/chrome/wilco_ec/properties.c
+++ b/drivers/platform/chrome/wilco_ec/properties.c
@@ -70,6 +70,8 @@ int wilco_ec_get_property(struct wilco_ec_device *ec,
 	ret = send_property_msg(ec, &rq, &rs);
 	if (ret < 0)
 		return ret;
+	if (rs.length > WILCO_EC_PROPERTY_MAX_SIZE)
+		return -EBADMSG;
 
 	prop_msg->length = rs.length;
 	memcpy(prop_msg->data, rs.data, rs.length);

base-commit: 7e1392a42ea288d70a266f6553fe06f57f8647ea
-- 
2.34.1

