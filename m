Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793993575;
	b=OZiY0oQFGg5D6ExZXhQJhtCFYGvxJhs4/XVorvy8DhsdRqbco2/Fv4eP6vq15TWYpQRa
	 vDT5cf1HPLsRr/ufOp+TJjQfUeUn/f+tFbrHVUsi1qlHQz8HkCsGLZ+k61dZLwYm02BgX
	 odVFQhbiKNiSoZq/ovCYgWF797qDo19q4pQP6qJf99ABgcwSXzAuQX5R66MMKI/Wguig8
	 c6wS6+dmWESaX7ILSGj+eqWs9UBKXlOGJlrawCKM9aHKn8hovdy9ILd6d5T0kXpPhlQkU
	 rQIM8iq2M0MuQeEu7iy/6kdMiuUBzsKlKIsJsRMefgISS592zITn9+gVPmTCeqA6YEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793993575;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=/r3iKwOujJ0k9iRfRMb2nXgYVKkbMoaxokk4Fx5YuMk=;
	b=K18SEQsgCXYFVmNbVgt7oBV9kJ4yMBgkWH7TXjZS8mfc3VbuKcGSRxX5gg5xOalXY0Hp
	 9lizGb0fEHN/hX0SZgHmDnKAyUv9TyiEc/6l5yAgY/j9exclKXIr+ze2LYwBRyTbj4HaP
	 /NPxwRoDXprI0f7A5OrQ+OD7psL4qpqZqPTs3e7ExXHQLnin6Xm3NJFnbOwVhQsTRS3Mv
	 Dg09lDkhePBzqIrjfeTkQqHdkaXYDzmJATz+XRSw+tlfYw3Q3EpgoJu/3peD/oKXaK71+
	 voBpeLdZR7/kYDH0c4yVyONQI5Mm1VVwACJlKOUOhbyhUA5l7p8NR544QShtZU5Cjxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dbalint.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=THN2tRZT;
	arc=none smtp.remote-ip=209.85.208.200
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com [209.85.208.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2960606A32C
	for <chrome-platform@lists.linux.dev>; Fri,  6 Nov 2026 19:32:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2960606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dbalint.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=THN2tRZT
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-3ab3fc6e459so2911fa.0
        for <chrome-platform@lists.linux.dev>; Fri, 06 Nov 2026 11:32:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793993573; x=1794598373; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/r3iKwOujJ0k9iRfRMb2nXgYVKkbMoaxokk4Fx5YuMk=;
        b=THN2tRZTRoNzis+7yyZnuSRk3D+sW+hCeJXyNrFFP5hsON68D1ul3A4MuSEehYfgMe
         E2Td9xKeWzYNiZIX3NGIG49DehMfcH+Nsvty4dxY3dOIE7zy1pchtyQBJS1gWKD/mbL0
         JxdEOcYwlYC5xCUtCyZfrFPekMv5AK3H0ih2B8yKUdMEcdWx2IOWPrW3tcjLpv3J8oAg
         q9VainBzGpmZjqh302iFEG86UsuLa5csKXIuaHomL5JEl4yA3qVEoiBEw3RNnXdT5oS3
         Z7o8wkV9KKK5uVvTwemRdznWcz5eLIybzigj2vHlWHL0IfvEYq18Fy4Y83uY9pfZdiBo
         CkMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793993573; x=1794598373;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/r3iKwOujJ0k9iRfRMb2nXgYVKkbMoaxokk4Fx5YuMk=;
        b=Gb9/D9hgg67LQrTjPGgMX5a/hDmaIdFlhhVjUMCro5w5yok9VEz9/ov1A/UImFtXRD
         fLvnUzTe1r8HHulhmsBA+rjtg/GlGwS9ZMIX/4nX0RifNpKdnA/pxSWgii3Q6Nncwpb2
         r1ALmseSAKJmKeOuJoAiE9VHsozfWnWFSlN/26SH2YC1QAgAxZ5lq7iHY1oeme/Iwtl9
         MS9JOtgN6SokI8P6+QGJtXX1iyJqq59UGlTgO9OwEXQvSbM2dyb66eLXWkQnDO35SdiJ
         3Gr5AT7QsOcdGLm2Oyu3EgXhikcoiSJOPcr7M1zPgnytqSlpxb1PolMMZsoE27sLCs94
         ojAA==
X-Forwarded-Encrypted: i=1; AL+hErHf3TtiZu2Uolq5EUPTw2awZo4N4xB0Ma0YDRUCKrG2C4s3mL3Wa1EE2Ixv8nxXJEmjw3YSy+TvpJQJzsI63wY=@lists.linux.dev
X-Gm-Message-State: APuU4Z+MlMvd2Km4a9LrB6nwPPn3BfUkiCapz9AbIfK0e1Wc7NLd0mnA
	gezhH43VaJyBunfa8tq4eMVWPZZrAc6Usm6BedjMSdhjGElxTG1inKc1ejlVEFVahSpwAytj+mK
	AENd68eFLGg==
X-Received: from ljou21.prod.google.com ([2002:a2e:b815:0:b0:3ac:e012:5784])
 (user=dbalint job=prod-delivery.src-stubby-dispatcher) by 2002:a2e:a80a:0:b0:3a9:8762:d77
 with SMTP id 38308e7fff4ca-3ace3028f4dmr14685591fa.6.1793993573005; Fri, 06
 Nov 2026 11:32:53 -0800 (PST)
Date: Fri,  6 Nov 2026 19:31:15 +0000
In-Reply-To: <20261106193129.43493-1-dbalint@google.com>
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Post: <mailto:chrome-platform@lists.linux.dev>
List-Help: <mailto:chrome-platform+help@lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
List-Owner: <mailto:chrome-platform+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261106193129.43493-1-dbalint@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261106193129.43493-2-dbalint@google.com>
Subject: [PATCH v1 1/3] platform/chrome: cros_ec: fix alignment of ec_params_pwrmon
From: Daniel Balint <dbalint@google.com>
To: Jonathan Cameron <jic23@kernel.org>, Benson Leung <bleung@chromium.org>, Lee Jones <lee@kernel.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>
Cc: linux-iio@vger.kernel.org, chrome-platform@lists.linux.dev, 
	mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Daniel Balint <dbalint@google.com>
Content-Type: text/plain; charset="UTF-8"

Sync EC_CMD_PWRMON structure padding with ChromeOS EC firmware by adding
explicit reserved padding to struct ec_params_pwrmon (2-byte union
alignment) and struct pwrmon_dump_info (4-byte struct size alignment),
as __ec_align2 and __ec_align4 expand to __packed in Linux.

Fixes: b57af7f8d194 ("platform/chrome: cros_ec: Sync host command header with EC")
Signed-off-by: Daniel Balint <dbalint@google.com>
---
 include/linux/platform_data/cros_ec_commands.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/linux/platform_data/cros_ec_commands.h
index a7bd69d83522..6d74371c7074 100644
--- a/include/linux/platform_data/cros_ec_commands.h
+++ b/include/linux/platform_data/cros_ec_commands.h
@@ -6635,6 +6635,7 @@ enum ec_pwrmon_cmd {
 
 struct ec_params_pwrmon {
 	uint8_t cmd;
+	uint8_t reserved;
 	union {
 		uint16_t set_rate;
 		uint8_t channel_id;
@@ -6651,6 +6652,7 @@ struct ec_params_pwrmon {
 struct pwrmon_dump_info {
 	uint8_t channel_id;
 	char channel_name[32];
+	uint8_t reserved[3];
 } __ec_align4;
 
 struct ec_response_pwrmon {
-- 
2.56.0.455.g6c5a503b38-goog

