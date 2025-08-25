Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4A92FD7A5
	for <chrome-platform@lists.linux.dev>; Mon, 25 Aug 2025 14:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756133889; cv=none; b=rZVyIhRm9/TlIiJFzgDFddsX5obgSXxaf0r3jHChowZ2sG+fmEEu4PMGJ9BOQjrpMeSLF/dSl0fUe1JhD426GHb7o0dyg2V3z9cNKLEerDRCScbqLi1SNBFzBo/pXqF7OOZhBZp6/E05kTuM9jVtHk0PvxuuJpqaCDWZorOfOf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756133889; c=relaxed/simple;
	bh=tkimgEY4C8jjn4oRfroM6cLsK17WffIXDAl9IE7NHq4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rdlBWWJENm9eCax/cfySbQ8vzcwDLCIjc1W75Y9XOLvGDl5fHux3h79CwygMVfrbE9cqPYR2x5UkpZK0VM4xfNFOYrtpgvXopYoC9+qF3QNOoltIdzy0kAnd93resSsgNpR2WQChuw9llKUK7stz11Q80WXkN1THqoHlXYgHKI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Z2QtBOP7; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Z2QtBOP7"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-afcb78e70c5so705696666b.1
        for <chrome-platform@lists.linux.dev>; Mon, 25 Aug 2025 07:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1756133886; x=1756738686; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qhhWTF/hAYz+kqb7eG5oSk05Be3U3tovVz6EKeBpeMI=;
        b=Z2QtBOP7wg4S7oQ5krJtAJFU4jvl1LfNd6mGI0JOPqpgPwde4Rws49OiJPuRt+17rl
         ohfKhwhPZayEGHmZ1lUhiPKiKKUpWjhg5PdKwHn4LVRPthFpS5atUUpUKZAxy3jfFsYU
         6Ne1bd8QgG81oXOOtZY8iq6cTqD/W9V3TkQIk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756133886; x=1756738686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qhhWTF/hAYz+kqb7eG5oSk05Be3U3tovVz6EKeBpeMI=;
        b=ne33IQYMirEvUVSTHciVqJD+kc28hl8nmhMA1St0+QPEb4SOUP2jFNo+oUGnyI2awu
         nLEdeCoMlFGfp0+OcJTOL0YmlafQh9WJvcCtTD5t3hit5kyvy96jHNeUXIO0BFUYrNlf
         ujGxql/KXGwjxhh9qS4P+maCTCMDDU9AiT497hGE3zqjVGnmuoTp2rylaVWauGavmsds
         k0cda5tl9QI9h9crQZLNdGozoykirAxU5mYMQgCqd91DOqs5RDuqnSaLAIIgFS7/B5PZ
         7lU9qI9GrSm9tjipqHLy60AQvwbPB3oCLvaS+xB4eev5hVhkzpj3oMqpTpwd0PzIYwcK
         jmVg==
X-Forwarded-Encrypted: i=1; AJvYcCVYnX3STC46bTbUhiY1xSrS+WGHfEK7qT3t35kzLr8JxNsx2d5IQjAAhMiwUcftgaGf6tJknU7GAV8XF4s2NAY=@lists.linux.dev
X-Gm-Message-State: AOJu0YyDnStr5Oal3omcaM0YzosaoJ9nWcMNDG4EMOqEFDarcbqIECNF
	vgoP+YsXebjwtChMZED2Gbyc+yEVxNZ3+IkC480dnl5ONhEGOaqUNrA45J2J6Mt6yA==
X-Gm-Gg: ASbGncvezgAqEjh15miexmsbDHccPEsw+aCRZvBer29lhnAzjtiDC8KaLw3bzxQvVv6
	yFfxRPuTr9LZm0vExaHplD7XYXBgHUmNn9Zc9sudOpEcLsIsZPX08zrywNPA3jN9ZbP4f5eJqqB
	bl19ssy90X0iemF1Ojp+DXUwRxw+BsZiD6MjSUCy4v32k4PMS+VsuI9PXL/oHKOWq+A1frQFu3o
	udFkMbMo4TFElScFgGhbKyJXsYGpaeMh9WIq4PTzNRFj3Pr/6ErbyqJ7BnNlnWM7a1vV/aZoghx
	PfgboteUsBJZmP7BLv/oSqyGusrBl9Yu+LBmVDxYnjkm41d0R5CFpHSVJysgKUf3ZoiHXaM+fUa
	j+qnwuttCD+8TY21Bl5wML4dDDjYB+f7Fktqr1o9BFtU6llWsMoaBz1L/At+v2XU14iW/gGEm/t
	Ut8XjwsYwKleiu
X-Google-Smtp-Source: AGHT+IEzjvHrN1iQIq8FAKzUqb34qM6bbiS8410ZZtrIWblYT3InjbPAMTBFJWEl9Bykqq/40gzsjQ==
X-Received: by 2002:a17:906:6a0f:b0:ae3:635c:53c1 with SMTP id a640c23a62f3a-afe2974ea3bmr1211128166b.54.1756133886030;
        Mon, 25 Aug 2025 07:58:06 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (168.23.91.34.bc.googleusercontent.com. [34.91.23.168])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe8d03f981sm117294166b.60.2025.08.25.07.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 07:58:05 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: Guenter Roeck <groeck@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	"Christian A. Ehrhardt" <lk@c--e.de>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v2 2/5] platform/chrome: cros_ec_typec: Set alt_mode_override flag
Date: Mon, 25 Aug 2025 14:57:47 +0000
Message-ID: <20250825145750.58820-3-akuchynski@chromium.org>
X-Mailer: git-send-email 2.51.0.rc2.233.g662b1ed5c5-goog
In-Reply-To: <20250825145750.58820-1-akuchynski@chromium.org>
References: <20250825145750.58820-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This flag specifies that the Embedded Controller (EC) must receive explicit
approval from the Application Processor (AP) before initiating Type-C
alternate modes or USB4 mode.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/platform/chrome/cros_ec_typec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index b712bcff6fb2..c0806c562bb9 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -491,6 +491,7 @@ static int cros_typec_init_ports(struct cros_typec_data *typec)
 
 		cap->driver_data = cros_port;
 		cap->ops = &cros_typec_usb_mode_ops;
+		cap->no_mode_control = !typec->ap_driven_altmode;
 
 		cros_port->port = typec_register_port(dev, cap);
 		if (IS_ERR(cros_port->port)) {
-- 
2.51.0.rc2.233.g662b1ed5c5-goog

