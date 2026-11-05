Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793894358;
	b=bQpG95ylEK1IkApwOKd+IXh8haA8g0sNzqjaDHvXTpNrkzNeWgNPoyMZSe4KoIhm5hQd
	 I/+zGb3aGCLTWZus+hbgAl6RJSgLHcWlILR0Oa2ogQDTZqiL2yiblcHkesLqW0y68Rb8d
	 /k6Qrv6BItWQMbt+u7xbreYFfunXubY3osESndu6iIiTlscsefQ4vkfzWOpwgALscL0LP
	 juhZihIWoOSRSSfx2ah4cQts7FqjXrtczCnrwd8YXSBkOpU1MeUrVh4nTiyN7uGthKdi4
	 OlOkh4b7yqkJn4FSEQmAkAO0w2kz8UfAa5l2RmHebMg4iqtTLfyX7fEltvHmZ7Wm4Bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793894358;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+hWGsr6KFBkJnsArQ4dbK5v+XZDeY/Y1/v6u++CjxWc=;
	b=ZBbq1C8KaZR368cRwA0pqr/NEsgH9zyFNXCaCpX0lz4V/VGSsbqvqACSajL7d60Lc+p9
	 qjUXizfHGR1Vup4sqs6lzhwT9p0cEwSbCO8ZEAkJqGoJx6Va5bI1d6QTzvwonaAIW76cT
	 nBtim9KzvOKap6srxf3JX3K4cQ35ul5ABpmsINd9EN61o6xkqs503UhK4QVxupgyLnVGM
	 pD17OThehEAljw5w7CXy9AP/0PNctR2pQt4LbN5seP3VL7aUnD3vMCb/v57rrGRW1v5P4
	 WdLOfz7YMCSsflgN2F6lzTEQPnqzZjkdyhQkxRSJSKYrd4aR2tyuZ2554aGO86CBZpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="DBH/kiW5";
	arc=none smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A38A606B477
	for <chrome-platform@lists.linux.dev>; Thu,  5 Nov 2026 15:59:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A38A606B477
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=DBH/kiW5
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b167ffd132so3295548a12.1
        for <chrome-platform@lists.linux.dev>; Thu, 05 Nov 2026 07:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793894356; x=1794499156; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+hWGsr6KFBkJnsArQ4dbK5v+XZDeY/Y1/v6u++CjxWc=;
        b=DBH/kiW5b3v4sze8UkrE2Ip40lbxF8L/LYZPvnC3LV1SUk4vn6QL6RkA3u5ZhJi29T
         zfbOUrr5c2u3+sXYMKCqO665ZZXceFpnAOpg+x65y8atmAp2bTH9vlNk4VD2Z3DGJ+ap
         gFuLl+jo0WaMHi6RnCxRr0WBEw3Ahnp3/K388=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793894356; x=1794499156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+hWGsr6KFBkJnsArQ4dbK5v+XZDeY/Y1/v6u++CjxWc=;
        b=qP2BCLi/xCxAgnZZN0QcubffPHCP3pd5htSzhkZAm6o2uMXNhuAxYuXeGR+0h1esRG
         FxbQtrKDQHqBpf/xoFONA52JajzLJ+bYx/QB4B8DxnMyizfYmr56foRTpZ64xdhbKOYt
         knrNN98g2qI6D9tzkwPrzq2VM/FglPuK5TxglXa/82l0xWIihH+64I8PK9PY2lgbjb8s
         yJ+OSV6Rq0ufR2lthp4fjFAWfd4zu57ahr8U5PqphtX1maGYVDcARUWjg6hVvNGoOccu
         8Sd+yU2TKs0L4SoseM3fF9XIPA3HHGz2LeTcd2M+Fmq39vqFT9vkeAZjnG97WAiFtvQy
         VJyg==
X-Forwarded-Encrypted: i=1; AKwUvBxdO2E5pY22Yq9ZnmSGTWiTbSzGn+g6amnnH7wRKGnY1KTqbdHsiGQMG0e/DdruHDtbDgyvYPfT6iZ2nMfVkjM=@lists.linux.dev
X-Gm-Message-State: APuU4Z9552LsHUT+gMLFViSOOSxFYV5ue4CpHYSA6Zit9IIk5hgfbrO3
	PKANzfW/XxjGb5OYQ8+V6OWAjZOk5yXOPB5Zf/FVf+d+a/feoYgBR88JTrcO3pPe3g==
X-Gm-Gg: AYBFou2D6DExu+4wRm25gGnSXevhiDhDj8ctWAiwohox4PXMj8fD+Ms+BZn94KNJ0UG
	wuK5BLEUyVQvWaCC3ghq+RfkDhL0PJHE6gFo26Zqrt6ASZvGCzCPzmpHCRySooPNxRUP7ls08c5
	7JSAYnTDGAbmvZHbKwqL6RPBmct81JVXxbXUxp3KKl6JCPnQd/krNd0MmkLJzFlAI6j+JNX+AgB
	Ro2OudgU+wRrNz0huO3zimuBtagUSufZB3yEhJuIgUstYKe8/SFjCSbowiHTd6k47xg1JiihE/V
	aR8Pw1xHLScRR50DnApx4RZpprIaGRlXr15bM/RVcyS/p5G3UFI5AmL+GMxTyjdk96drGUqucs+
	yGmj9dnzSJFZYw3e7KBMNVzWn4s/grt9eSERpWlJqTjGAk40cC7+mpEGOY12LMYSNo1N91vEfQ0
	nOdnB2JGRq3Fo6pFEMNvar5Pniws7L7IVIVa2b506Y3A8HdX3KqMslgPEeqOKzyiObkTGugAMNs
	7WQMBgCzkwyWCuJqf0DeLSkjWRozA0maQWsuaQKn15HwAPf+56R16B3xVRiJnBV3vgDWUHnwY27
	WC01jdykgopMpKdwuU0t8dmKKs4zmTRmtPg3eOuztyAZvPkJGyS8T0qAh6++kbKScm1/Q5odW/f
	DeZQyGNf55vkpw6VWFw==
X-Received: by 2002:a05:6402:2344:b0:6b3:e575:f4da with SMTP id 4fb4d7f45d1cf-6b4d33ab55bmr15476523a12.4.1793894356329;
        Thu, 05 Nov 2026 07:59:16 -0800 (PST)
Received: from localhost (103.45.147.34.bc.googleusercontent.com. [34.147.45.103])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-6b58c868e70sm298094a12.24.2026.11.05.07.59.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 07:59:15 -0800 (PST)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Jameson Thies <jthies@google.com>,
	Benson Leung <bleung@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v4 2/2] platform/chrome: cros_ec_typec: Reorder altmode registration
Date: Thu,  5 Nov 2026 15:59:06 +0000
Message-ID: <20261105155906.2670094-3-akuchynski@chromium.org>
X-Mailer: git-send-email 2.56.0.398.g882cbad275-goog
In-Reply-To: <20261105155906.2670094-1-akuchynski@chromium.org>
References: <20261105155906.2670094-1-akuchynski@chromium.org>
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

By default, alternate mode priorities are set in registration order, with
the last mode registered taking precedence. Changing the registration order
of alternate modes prioritizes DisplayPort over Thunderbolt.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/platform/chrome/cros_ec_typec.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index aeb3de4f09934..b13b0914a2cea 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -444,16 +444,10 @@ static int cros_typec_register_port_altmodes(struct cros_typec_data *typec,
 	struct typec_altmode_desc desc;
 	struct typec_altmode *amode;
 
-	/* All PD capable CrOS devices are assumed to support DP altmode. */
-	memset(&desc, 0, sizeof(desc));
-	desc.svid = USB_TYPEC_DP_SID;
-	desc.mode = USB_TYPEC_DP_MODE;
-	desc.vdo = DP_PORT_VDO;
-	amode = cros_typec_register_displayport(port, &desc,
-						typec->ap_driven_altmode);
-	if (IS_ERR(amode))
-		return PTR_ERR(amode);
-	port->port_altmode[CROS_EC_ALTMODE_DP] = amode;
+	/*
+	 * Alternate modes registered later take precedence. Register DisplayPort
+	 * after Thunderbolt to prioritize DisplayPort over Thunderbolt.
+	 */
 
 	/*
 	 * Register TBT compatibility alt mode. The EC will not enter the mode
@@ -471,6 +465,17 @@ static int cros_typec_register_port_altmodes(struct cros_typec_data *typec,
 		port->port_altmode[CROS_EC_ALTMODE_TBT] = amode;
 	}
 
+	/* All PD capable CrOS devices are assumed to support DP altmode. */
+	memset(&desc, 0, sizeof(desc));
+	desc.svid = USB_TYPEC_DP_SID;
+	desc.mode = USB_TYPEC_DP_MODE;
+	desc.vdo = DP_PORT_VDO;
+	amode = cros_typec_register_displayport(port, &desc,
+						typec->ap_driven_altmode);
+	if (IS_ERR(amode))
+		return PTR_ERR(amode);
+	port->port_altmode[CROS_EC_ALTMODE_DP] = amode;
+
 	port->state.alt = NULL;
 	port->state.mode = TYPEC_STATE_USB;
 	port->state.data = NULL;
-- 
2.56.0.398.g882cbad275-goog

