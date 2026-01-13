Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF903904C2
	for <chrome-platform@lists.linux.dev>; Tue, 13 Jan 2026 13:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768309557; cv=none; b=OcFCfbVDhb/igYih9tevH+ZVULUts8mBbDoCoROtb7LG3da4wMfksgGguvE+IXTZcHeQThe9JHun/h2c7l+LTajEegLtKlSqj/xcgVpYDHUeM9TOjxPldPRBlnHnuBuSMMxA1cnKEGZEoAxww8aolFe6Z/ZalhwaEmJKRJJHzEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768309557; c=relaxed/simple;
	bh=+JaIC+XYxgvHZoYamzUQwiwiebl7OEagOKElTNuRHxU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uh8kngiBFT9VF1bNcd9y9q7ZV6Crru7fWHlK0mVGEtRCC3/llVQdr9fY29F6p0kIumfkQTHZOaG6WWVYxgKhofESDF5Ocq/czA4EEt0VADfQhqYEfGAYZFjOByQ6vHCa2BkUsMnMPbfzBqzP8RmHeTpy7N/gIlfIRRC8coElj1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EncJgS4v; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EncJgS4v"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b872cf905d3so282987466b.2
        for <chrome-platform@lists.linux.dev>; Tue, 13 Jan 2026 05:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768309549; x=1768914349; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZCVsnNiF9taQOhEY911oRHXRaOv1GHlaDH7WrNRKjM0=;
        b=EncJgS4vRpwQ1J2Rduam/r7MIFtNgvF62UCt27lITANnmmeXvfwG0+k+4myEgGAnws
         SzO5U3ubt8eCvshbSk0ZtXGZMTfqdJrcxd+wCyIUFj/eh2gdsJUN9YcwNHAVWJ9KmQvj
         T5tCoe8yndDBE4OUBj+XE2AjyaOfTF4nqSapg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768309549; x=1768914349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZCVsnNiF9taQOhEY911oRHXRaOv1GHlaDH7WrNRKjM0=;
        b=rGGzkKDSzMy15oI9dUQV3FPi4fGP/74USPvq3UiZJ0l/88uKuW2/zNkT83vLQgLefJ
         FbVGyaup7c/Mt+VBSCMBwQCV29Y7i/7EMhqfuVnRu+0KUBghxgrTYNsKnZAgBVVIiSBm
         8VVVhaF/5elvrY/1PQ13Y5AWd+HfL/4w1ohwIlx2e7yxj/bgtS19yzMojA02p/GcVr9J
         tO7LkGakLRjViWYVWS6UNfrYjwr+ssy4GloKB8kOmrO8ued8bu+wJL13kxgalDy2Pr6Z
         QTqhDl4FKxzxnxkyrLQRDCXwR5KEX4g8TQp152AdilxylSEHFwboUg8rUl4eLYQ8SI7B
         CAYg==
X-Forwarded-Encrypted: i=1; AJvYcCXiJNY5SfCuor0nZNhp/3czzYd0DWgGuXbw/VzT0vav9oskHE41yD61c21C2RdMgwFeGx7mj0F3rM9kEIgOJgo=@lists.linux.dev
X-Gm-Message-State: AOJu0YwKXO+9tlWPjCPt01pFa51wrcBWj8uD7AC6i1vbKoWFSPExoEO9
	2NY9m6qu9LXtmffugDvstwXfnB21tStprkHFyu/GTAw3FruYce9RmdHJRwpA5a8hQg==
X-Gm-Gg: AY/fxX53hfuPYy+MbztoXxai6mhOj5FGNSheWIT2bxbhQhW7RNQVZ5COUoFE3j50ApI
	/AMbnaCpml2ZR6CN49hjydU2M7RU07A9clfaTjZX1LCDb3ZqT2oeJxM/lEW/8iGxb3rB63VWF7D
	sWVsRIiYNruQFgOkg0R4y2LvMaO8I2GXkTLkAgG7l5GP4cJnsa5wZo3H0L8CqUnDmOpAwugriED
	cN5DfgTkmythLp6k5MmqOMx4F02hmBAqb4WK8kPQU/EwWnVaXeS3IuvkSl61ZCDI3kCta33E3X5
	0ggXs2xQm9FHWqnJO7yPypS270VA1P9boZq53bhEMxDk0NPh2nPNlY/wCpeY88S7DwRth4ctf1g
	rY2ZzIz3GWhq9kmS6SwUG6U1wSJn6SoqKxs8stvXXpwByMd+coKmRPytQB8KYDDa3zoQGY2AqKb
	CbFqPF15XanW2d/AQX1lRFI4RxCdxxG8ro4/lFTGushWfy2WkSKO92YEVL0K4dNc4CdG7zK1+Xk
	e74UeIf
X-Google-Smtp-Source: AGHT+IHQrZeQ/CRIvkRFs9Xv/iIOSXPTXMS2jM8rkvlNg8AKY+SdRTPp2Q3LTRtbojrFp7c5Z7Rq6g==
X-Received: by 2002:a17:907:7b88:b0:b87:892:f43f with SMTP id a640c23a62f3a-b870893074dmr819575266b.29.1768309549279;
        Tue, 13 Jan 2026 05:05:49 -0800 (PST)
Received: from akuchynski.c.googlers.com.com (150.230.32.34.bc.googleusercontent.com. [34.32.230.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b871b5e60dasm586217266b.63.2026.01.13.05.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 05:05:48 -0800 (PST)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Johan Hovold <johan@kernel.org>,
	Hsin-Te Yuan <yuanhsinte@chromium.org>,
	Madhu M <madhu.m@intel.com>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v4 3/8] usb: typec: ucsi: Set no_mode_control flag
Date: Tue, 13 Jan 2026 13:05:31 +0000
Message-ID: <20260113130536.3068311-4-akuchynski@chromium.org>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
In-Reply-To: <20260113130536.3068311-1-akuchynski@chromium.org>
References: <20260113130536.3068311-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This flag indicates that the PPM allows the OPM to change the currently
negotiated alternate mode using the SET_NEW_CAM command.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
Reviewed-by: Benson Leung <bleung@chromium.org>
---
 drivers/usb/typec/ucsi/ucsi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index a7b388dc7fa0f..deb210c066cb5 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1659,6 +1659,7 @@ static int ucsi_register_port(struct ucsi *ucsi, struct ucsi_connector *con)
 
 	cap->driver_data = con;
 	cap->ops = &ucsi_ops;
+	cap->no_mode_control = !(con->ucsi->cap.features & UCSI_CAP_ALT_MODE_OVERRIDE);
 
 	if (ucsi->version >= UCSI_VERSION_2_0)
 		con->typec_cap.orientation_aware = true;
-- 
2.52.0.457.g6b5491de43-goog

