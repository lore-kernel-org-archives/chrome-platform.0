Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0BD79476
	for <chrome-platform@lists.linux.dev>; Thu, 13 Jun 2024 13:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718286922; cv=none; b=gG4bD7esfiU0tlDfOY8WwR3j/skAduO9zwy27MmBkRNv3f6y3w4Ud6Ku9k+qV5guGZzX1kdQj2CsNiprWwnMbQH7BOc4SoTA1udikx+47NQRlHxUDdDFob4cc3xHjDIO8ghn1mHkHaCvGdfsJ/ddKvj9uFCLbSnE1mSOeD+ubXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718286922; c=relaxed/simple;
	bh=vVwvkMaZAYjZyqicTOx1nxvLkCMqD5e221Va8hSK8uU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pvHjldEXOhWvznJRFhvkMtVlSznYVkog70hObp4EDxd4CAn4j0OXuEFZas8m1KOIMnGTujEzF2uMoM0NTtYtrlc2wHwWjCs0blm/tWPjP7u2INeTjndKdBTXwTimM1mqP0wm8Vw5BPg0vJXhO4avg/0NRmlTwPcXHrk+Pxx0zFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QwXgShm1; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QwXgShm1"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-35f2c9e23d3so1459163f8f.0
        for <chrome-platform@lists.linux.dev>; Thu, 13 Jun 2024 06:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718286918; x=1718891718; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tFttpI6mxFfYOQDKQEDFzq5Zkmvl1Km0kHopsmHSaog=;
        b=QwXgShm1gJXYu1jGOW0AjktDJ4GKqa17DjPu18GGepDZ1q6hXNsga0XlKUNjTuxsME
         m4MsYcro3zLp+KLsYwu+j6WWzw+8Nyj6uv1VOUR1rrA3It47NaEjpcpFuHWeLEKIqncE
         kwXoYaQ6fE1omvgqulLsYIJdf6Y8C8X4fVqcQMXgY4e8MO8XucbaPMRtbhzKD4caNGVB
         z4pvKjiSZ0mBH06ik6F+tI6l4AIxwVO8Za1Jb/ni8TvlOdNsdTt3zGk9UmRZ6bRoRvXs
         FPCwWrWA0cM8uLaoLLSEm0/Yuuo1+f6VoH2jlmpjHkXysa9bOsk3epleORZNZZKnVBM2
         X40w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718286918; x=1718891718;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tFttpI6mxFfYOQDKQEDFzq5Zkmvl1Km0kHopsmHSaog=;
        b=UFP0zBo3B/Zb1A0o5UP+4vvnNYO3a3j1IvK8riebIQ5QT0KODIeWsrqQqSAwS7fzXw
         m32JYoW55ZzxEKgETSfVyUMEqnj0ECPBpjBVjtbiAaGRSNy0HW5hailH7qR/cBpNg2a4
         WBEIAZwJOkoTQ1MqdNBugEVUNrE5GaNiX9Js/8rsuk/affF/3AU4U2kvC+S19ntnL88L
         SfGe3JB9+v6ENlYd/8DTnLfw+dC+/HP/KrIRrT8PCuRj2qSLbMc9pCbLrJySoSvyRgYu
         qYTO1Xbz+pN5gio81sOb4lWCxyxbmEUD5Y7kAG/bq6vZ+XtT7R2mkh01ptPv6WMfQyAC
         yvaA==
X-Forwarded-Encrypted: i=1; AJvYcCUEjzs6w3uJY0ux+9VCylurwaTC6XoS4UhqSbTqysXWFLMgnaYkmCZFxGKdDTbQPhZAhvmNLuNdwEMEWZl4DnfjCsVjyORsb3SDzEP9IVyu
X-Gm-Message-State: AOJu0YyCR4cyQBs7BW2aC4om6Sjvl52J5Kq7gNhiiyCEY2SZGVE2/+3i
	4TFMb36v5dR6S2HWgmoOFGAimAhgbwhyuFuga/5dunymtKKEJkI+SbWUtmqEKII=
X-Google-Smtp-Source: AGHT+IHrkX+CcccVhTGNwfhUGtMYn8rDSIQG438y+DU+7wum/b95cyXAUO7wmOgn1iLVTP1LFzTVsQ==
X-Received: by 2002:adf:e646:0:b0:35f:e890:fbe1 with SMTP id ffacd0b85a97d-360718df02amr2564058f8f.19.1718286917900;
        Thu, 13 Jun 2024 06:55:17 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3607510315csm1778848f8f.90.2024.06.13.06.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 06:55:17 -0700 (PDT)
Date: Thu, 13 Jun 2024 16:55:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ben Walsh <ben@jubnut.com>
Cc: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] platform/chrome: cros_ec_lpc: Fix error code in
 cros_ec_lpc_mec_read_bytes()
Message-ID: <e0b43fb5-ecc8-4fb4-9b76-c06dea8cc4c4@moroto.mountain>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

We changed these functions to returning negative error codes, but this
first error path was accidentally overlooked.  It leads to a Smatch
warning:

    drivers/platform/chrome/cros_ec_lpc.c:181 ec_response_timed_out()
    error: uninitialized symbol 'data'.

Fix this by returning the error code instead of success.

Fixes: 68dbac0a58ef ("platform/chrome: cros_ec_lpc: MEC access can return error code")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/platform/chrome/cros_ec_lpc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chrome/cros_ec_lpc.c
index ebe9fb143840..f0470248b109 100644
--- a/drivers/platform/chrome/cros_ec_lpc.c
+++ b/drivers/platform/chrome/cros_ec_lpc.c
@@ -139,7 +139,7 @@ static int cros_ec_lpc_mec_read_bytes(unsigned int offset, unsigned int length,
 	int in_range = cros_ec_lpc_mec_in_range(offset, length);
 
 	if (in_range < 0)
-		return 0;
+		return in_range;
 
 	return in_range ?
 		cros_ec_lpc_io_bytes_mec(MEC_IO_READ,
@@ -158,7 +158,7 @@ static int cros_ec_lpc_mec_write_bytes(unsigned int offset, unsigned int length,
 	int in_range = cros_ec_lpc_mec_in_range(offset, length);
 
 	if (in_range < 0)
-		return 0;
+		return in_range;
 
 	return in_range ?
 		cros_ec_lpc_io_bytes_mec(MEC_IO_WRITE,
-- 
2.43.0

