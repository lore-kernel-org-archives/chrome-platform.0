Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CC04772BD
	for <chrome-platform@lists.linux.dev>; Fri,  4 Sep 2026 11:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788520155; cv=none; b=sO7CCT5dw/uSyzlAFsbqQJd/dYCmNL7PQbJaU+IHstWJT8DlwIllMcmrnWkjkC9MQ/WGyCndbQ84f9JbQIfca8M0fqLKx4OIEbIyPRT4BjxT9pWyEH0G5ks7DYwIk7i7Xz8w8WP0pAAwWHm1UMEWTqVjmITPGI8ilRUhffpMOgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788520155; c=relaxed/simple;
	bh=lJh/NV90iACtAKBRabXZVE6E0+jqYyGArt/IrFYqr+U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=phQwX60dvfEieTqVMuwWInhzzosp7bO2x472zm24nz3MC/IUrptiJUS7hFPUfDbxdhKhr0rsYw4ywbEEqdOyVzt5qF5XfNunyHb+mU7pJVo15tRIZuyCSH6UzEKogjbDmcMnpMAOZVQnmlyPT5xhSbBC5mGVz/vUWCwcArXPu6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ofu00vV9; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ofu00vV9"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7f432ac553fso687146a34.3
        for <chrome-platform@lists.linux.dev>; Fri, 04 Sep 2026 04:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788520152; x=1789124952; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hSaDss1c4tyLO1aJNg75LC2jBfZ+NbZc0L83zGAsFPA=;
        b=ofu00vV9oCeat6x2bF+a7tymFop44wZiITT0Ku+83BrqLcNk7j3LIXoK5k6ALfS5ka
         +1OEscObitFJ3SPD5NOwEwQFoTMG9Y14gq0ZqfwmoXU8dgIqK9n9dYYydYIoobK75ugo
         r2RCruY9htS0ImmVlL+KONJSZ5VeIqDBFUAVFHwxP0Jzh9xteiVRQDnUw0DT9GEkjIdE
         HWxo+oqQhNyX67wbMsLhRX8pOI3yhSqm9wZLoExpg9rhlTHiCsD/QJxIQeRSBQsKF41D
         5qzxXljMz+IvwHxJ4dkp/bILz+4OkY7H2rp20E1hOxjVOdq/iA/x+vInELT1w8KC+xjn
         UP1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788520152; x=1789124952;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hSaDss1c4tyLO1aJNg75LC2jBfZ+NbZc0L83zGAsFPA=;
        b=qyFoCwnl5aLvo7Fjw5d6IF8OueECn23A5OKu/O5j9FfHbzHMcUYv+ct+HLqdKQk5xd
         TqfFXhcp1FW5L4zAfXUR5VOmzccZMheGhPZR88+dPrxQ64XHlnZZc72q1EIG/Uq220KK
         W3wj8Rp9es6klOTkUpG411FeQK+SR2RA6F9l3NdnvRn+cit/Tdd1dpgR2o0Aua2ideKZ
         HykXpDIkz6VdjGhdyNcQId0mVgc5FgA2GtmX8MNQMa4ieRWDFTwvoWxB8ZqN695ULlAL
         08ZaW4sb0LEE5Dda+ocznwy76NSJuvBDNa9qvuRg3eQVMHJFD79O5hM6rWvVYJCrzd8t
         Vekw==
X-Forwarded-Encrypted: i=1; AKwUvBxIGWWbTIcuNYPZpI8QfKALho1dkcr6Pd/y2DsvWVKjVCfcwlBmZAghRwDlcaSYmEL5JeAcXCbaqu5ONiahZUg=@lists.linux.dev
X-Gm-Message-State: AFuF++mxnf7veO0+/POu1ltLP29e1mWR1MZGB3NXBni0I5MT2ChCThmn
	jEsB2PzTts5/0WU4Dp3jkkOxYAqaoqGQ+8aGZDoQynSm71vO1odjkVnXpvvXTixdQ6c=
X-Gm-Gg: AYBFou2MY9X+2wyOHXoEqv6tk0pSN14aqVaXIDFiDC6ScLIrmX5JrVO4Q+iEANTRGGa
	CFcNVrgD5Bxua0PlN53IQMdzF1kC9immkvdmNFO2Wd0W7L/yk8021j5zpa6gMPQFgcqgX1Pc0K/
	JFu/lxP+wU0ceW0lU3A0LaCxkqoBa2qtxljjxShN/nBZZBy9qYcEAMOXot+z0Q7XwADpycEiCgd
	S8wjUTyYoxKly4/KfOELUNxQrkt9EDsdt49iFwlvgbnSXLB362tt9BC3s9G0pcEYo7Hq59NKx51
	sLi+HJhdwLNkBs6WFThj/ewZst8duOIAb8GId+Zc+G256gR9yJvs8pgpNxF4dSV82Sg7w/OCBWM
	9CQDqXLLQTYPpXt/33bbrTBvaSPhBDzdb51rslq2okZnZz1Sr2JhgEJAAXBWJljcDPo3I/dJa2a
	zghWUV7yci0y+nFy3RPp57O2cGip7wq3+64UH1hS7n4Og5VOEN0A0VGdlNftsd1ce0LWu6gg7+B
	cchnyJu9hhScrH4bBbitZJHaBc=
X-Received: by 2002:a05:6820:61d:b0:6ac:a994:8794 with SMTP id 006d021491bc7-6b6fabe0728mr4455404eaf.7.1788520152161;
        Fri, 04 Sep 2026 04:09:12 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b123731sm5599656eec.18.2026.09.04.04.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:09:11 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>
Cc: linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: [PATCH 2/2] platform/chrome: fix repeated word 'from' in comment
Date: Fri,  4 Sep 2026 16:38:58 +0530
Message-ID: <20260904110900.20435-3-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904110900.20435-1-hemanth.selam@gmail.com>
References: <20260904110900.20435-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop the second 'from', reported by checkpatch.pl as a possible repeated
word.  Only touches a comment, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/platform/chrome/cros_ec_rpmsg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/cros_ec_rpmsg.c b/drivers/platform/chrome/cros_ec_rpmsg.c
index 09bd9e49464e..7390c2c91ea5 100644
--- a/drivers/platform/chrome/cros_ec_rpmsg.c
+++ b/drivers/platform/chrome/cros_ec_rpmsg.c
@@ -20,7 +20,7 @@
 #define HOST_EVENT_MARK		2
 
 /**
- * struct cros_ec_rpmsg_response - rpmsg message format from from EC.
+ * struct cros_ec_rpmsg_response - rpmsg message format from EC.
  *
  * @type:	The type of message, should be either HOST_COMMAND_MARK or
  *		HOST_EVENT_MARK, representing that the message is a response to
-- 
2.48.1

