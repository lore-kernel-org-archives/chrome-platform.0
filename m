Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7A8244681
	for <chrome-platform@lists.linux.dev>; Mon,  4 Aug 2025 09:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754298269; cv=none; b=US2qdsRfgoCQVkYHaHZGGriAjIqp/RJUsJ5MnRcSHb0L0tbf57zElLitkqx/P07TudTNWgJbYZO1235CyVBza1ZA9hzRHeYec3DcNICx4ZsiJKjS3s/c2xdfMF8Jk5PUHP/pRRSgadw0XxW7SMamXJG2L9lNKx3X2WByMc2+t08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754298269; c=relaxed/simple;
	bh=6Bhn8TVLiVPA/DDpJF49VzDOxmDs4HWaQoUsOlq8plg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aPr+CCvhnqmyuEx/5KaEmT8a00CRVo+aJgsn0pLbHg+l2C5DBALnPiMOUl351iUhFUjbfg/h4J6AC3rHK5n3Dea47ZMlvIQecANwYv8SL/4OyZvUqicUcEdwFXnR+y0LLv+rmpr+BZ50+lqubxLa6iIhw1LyK5Vq96sipy0MU44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=niBo6Fxl; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="niBo6Fxl"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-615378b42ecso5222409a12.0
        for <chrome-platform@lists.linux.dev>; Mon, 04 Aug 2025 02:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1754298266; x=1754903066; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q3zkd9Jg/1IWWLetRvam/cO4b58x4mGvV5kNliFnOgc=;
        b=niBo6Fxl9Gz7AsZ5pDAlpSxTTx1He10asZIyT5HLdOblBaZ4rm4+mNnIaoDQlwHuuN
         lbwo4EvR3XNa4cQda92ql70MJ+WSk4m9KoklhBMVa1r2oGjC8CwRguSVE0b3rVufHTW/
         DTBaEyFm7S6calMK98Qg8Jxq0O0m5oWhRB9uE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754298266; x=1754903066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q3zkd9Jg/1IWWLetRvam/cO4b58x4mGvV5kNliFnOgc=;
        b=caRk5cnQl0M9xlKlGu6a++Cduxw4iOzkzmlR89Mz63Y+Nx7bPCNA7eZ2Pv3ZYkc+W/
         aJOo7u6cFvgTU8W3zph6NgvAUSO6FFrH+x5iYXug3LSo0bPqbNLi48PrUsTotAvqBaxK
         ruZw2tZGoXGkJzg7iyDRJQ0gVxHBmLIRPt/F85gPE/6Svt4b1hqsqspMuXIF4IuCS13I
         S+BMOX8ZYW9w+7tOpn6eKBDDVYprddKPHqsiSqjDHm96vkIpgTk2xy6icB+WuyR1G9Ki
         9wr5EPkT6OHgoek7LIlNAfCszfMnvEbFbUCjXAih3iznsFBtN9Aw0v46pVFg81YXCfly
         tvGg==
X-Forwarded-Encrypted: i=1; AJvYcCXVe3wGrDVk98bHuYbKjD/rrxTSUhhefvyjvpmIXU2VQbLZyXTRzrtWLTmlFGB9EenLidSlne2UYjtuu0D/38E=@lists.linux.dev
X-Gm-Message-State: AOJu0YyA0raxGl+Yfuiu6/UZ8oUoOJJaoYEQXWEmNXnn5+D6eStBfI2R
	7EbZBuxNm7qyh+UcpNFsFTEAMFYPosHFdzMfbI+tPBHXAkQjnZALlomLyBwPIv7/pA==
X-Gm-Gg: ASbGncubwQ7WSCKPJ2VttLjalgXrR2xHKXpNF+PkR/kPPvEeWfFpNG8eM33gr8qEfyc
	/edZsaDhmBrOy+cMON+e4dBLL35jgGpnOgv0HCPNEtT2jTzF5UwRIWHPcReXNMkZVWCwhH9ZT0F
	NbSI4g2+5ksYECbIWkyeVzdR/7flBYl10m78rsJyvfStNbVmmjXxeUGppcwMfqkmTEJbOdUeoup
	Y58y+JRocU8vI2G7fVpEWkAEZ4HaRVVYxRiH8Q13XbYmRjM9//LxnEr1rBJqUtHYzf7vtukXv1r
	nKZJnE4YfYJtOfNJ5eJyrZ0i5/wbadRLOIZee7cinZNUyHKUMNbdupAoIe21uFC1MEZGgLBnv08
	gn3IOsIci/MaKHJosSPqARj3ab0IHrNS09F/1h65IOr+MK+DR91o01NSN0jzF+lXXULOSOn2YIb
	8HoUpGtfva+DotcBY=
X-Google-Smtp-Source: AGHT+IGW/LCLdhCJc2+ufotVYylvigS+HVY0E50Z6NorO+AWbE3p7ae6GP/d5eD1odizSiqENv3SHw==
X-Received: by 2002:a05:6402:40c5:b0:615:a60a:38a7 with SMTP id 4fb4d7f45d1cf-615e6eb549dmr7470597a12.7.1754298265812;
        Mon, 04 Aug 2025 02:04:25 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (150.230.32.34.bc.googleusercontent.com. [34.32.230.150])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8fe7995sm6412790a12.36.2025.08.04.02.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 02:04:25 -0700 (PDT)
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
Subject: [PATCH v3 03/10] usb: typec: ucsi: Set alt_mode_override flag
Date: Mon,  4 Aug 2025 09:03:32 +0000
Message-ID: <20250804090340.3062182-4-akuchynski@chromium.org>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
In-Reply-To: <20250804090340.3062182-1-akuchynski@chromium.org>
References: <20250804090340.3062182-1-akuchynski@chromium.org>
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
---
 drivers/usb/typec/ucsi/ucsi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 5739ea2abdd1..5ba8b1bc874b 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1616,6 +1616,8 @@ static int ucsi_register_port(struct ucsi *ucsi, struct ucsi_connector *con)
 
 	cap->driver_data = con;
 	cap->ops = &ucsi_ops;
+	cap->alt_mode_override =
+		!!(con->ucsi->cap.features & UCSI_CAP_ALT_MODE_OVERRIDE);
 
 	if (ucsi->ops->update_connector)
 		ucsi->ops->update_connector(con);
-- 
2.50.1.565.gc32cd1483b-goog

