Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47923009F4
	for <chrome-platform@lists.linux.dev>; Mon, 25 Aug 2025 14:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756133892; cv=none; b=URdOKCGP6hnSZHRqJVy24AWbViHAtunQh0mjwxQcSdJEAr9hp2bWzG1JlTxlNyI4b7ecyMEgLaz91ts7tDosuYOI4teOWOwCmmjC4D2e+b2+i4C7hRA8WvV3JT91EDl4a2LoxYTm7KPu+Mq/lmMJ+Yb5op+ph6x+G8AePylMFhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756133892; c=relaxed/simple;
	bh=sCzcaHvyNBs2XDXKynfkNcDEJnlMJJf0GaVUdmsnhSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JeDk4qTC/0NhnIctVhmC0kEjT25xOlyjGbBHqZSWVj90XhZCOCIrwrQFaNikOQr+GAPn5U51R1dUtoVHKQGTf7LGCp8dNJWO7QweRBzR8y09e979D9BoDI9J0PGlWm6vcYkMvqfwZVBW0mq86E21O6yiTg2vHnNQylYhuA9bVBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hB50PbsE; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hB50PbsE"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-afcb72d5409so747500066b.0
        for <chrome-platform@lists.linux.dev>; Mon, 25 Aug 2025 07:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1756133889; x=1756738689; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xEe7YY1Cpi7JTuOOA0pZSF33Y12/vgAOx6rgD/OGWgw=;
        b=hB50PbsEjus7+XAFB0AS9+52HIfrrnYQqr6Ebm1MejZinP9zzvp6P1LPTPyxvIDP7o
         JKDUtZoqsW8vNQ6oYCz/wRjeYzfSwV79QTyqH69C3iI6z2qclM/xLpSdDS6tDc0iYRlK
         WvEhxQ8OUM7wcG+6zPYHhrozfAZ5and6rBwlk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756133889; x=1756738689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xEe7YY1Cpi7JTuOOA0pZSF33Y12/vgAOx6rgD/OGWgw=;
        b=EiCdpvRQk+aVxxdXwOR8AFO5A7Hm/DICRyF6y8qG/LDM7qMFxr3iMuUQGyg0nWyRVW
         RhCfuwWFJDDs+tQJJmY9V4mSqq+2zxhiZlDgGBKbfuJpcVwczE3BbHB3vK7BVaWzMShC
         M0EFu0anME1FEzueYVsWCyE7SqPTG11h3Ma+OrmRLGFV5YRXOMXvEypp2Rujm2/M7WnL
         cUgn6wHuxOI2ewI7XcOL+nS0dpQneUgg2SCTk1wqxankIt0fbz4rgeSObmUt8II2AHHK
         +q6Ak75FvmPTPeyFnZncTkySXpQpFlm6ACybSUowk6pTa3OZM/cG2dUiDXadHm9jSgDw
         1IXQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/xus2j1sRzJS6rRdKrWZnhg9IGp83mHgfKvXoNSMNSFf4gwEvHTxOC2yqr05vCFOtkSfKcO/6UwV0lHrXNpo=@lists.linux.dev
X-Gm-Message-State: AOJu0YyPXlFVrDWld+2fkOPY20Ynl9S0rXFzqTuLMKVSvKvDGp2Cvw81
	a+To4vBNbtIUiBF9QeSGRQkeU9TTZ/IRqlX2hQCzdD6ZCAAKoS+caiHHaLnjxqjKFw==
X-Gm-Gg: ASbGncu7zLlcJzCNTdqsQES1mN4JimBdvJ3Vvz1gVUucN/tYNb9usZxAdr7JuFE5qbu
	Fwpu7jukT/voNjDaAPp/4AenCyM0YraacbLZz1GUI0VBaRFFgx8qH3ZeY3mpvsPzijo/hPeFxrD
	3LrZ3WIm1qeBY9frayGELZKsJOv47C/jaVhzGWOCKrHmhrJJqJTDuqAf/0nnh6kOrnRqnB0Km+h
	iPpLq9ljNN3OSU7ZGLZK196xnwCFtxmPjl8WLjTEIxFbBUOmQwMj3gOA0Ut94/qLryigEsv/HAm
	nFFPiyxGkT3bI0IewH+TDIz8ho3+G/WDGDcgj60sCqM2s6FUqERTghZvYWg6/4Q0YC1pt99DZTa
	x+X5q/t5AqryuJXbqAa5ln2BKmtVe/ZfH4zbJRNDQlnx5HdYfr+Qbx9Qs5iWsGYOKO89n2774hX
	+2h79yd8oR9I4+
X-Google-Smtp-Source: AGHT+IFyGVkJn7Pe4QajoYR658kFpe1L884A54RCJlaO5lAZ/VrHyO1MunmHlcOvbaeR2ixPy/zAag==
X-Received: by 2002:a17:907:86a1:b0:afe:735a:fdf with SMTP id a640c23a62f3a-afe735a1362mr500412866b.36.1756133889266;
        Mon, 25 Aug 2025 07:58:09 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (168.23.91.34.bc.googleusercontent.com. [34.91.23.168])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe8d03f981sm117294166b.60.2025.08.25.07.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 07:58:08 -0700 (PDT)
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
Subject: [PATCH v2 3/5] usb: typec: ucsi: Set alt_mode_override flag
Date: Mon, 25 Aug 2025 14:57:48 +0000
Message-ID: <20250825145750.58820-4-akuchynski@chromium.org>
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

This flag indicates that the PPM allows the OPM to change the currently
negotiated alternate mode using the SET_NEW_CAM command.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/usb/typec/ucsi/ucsi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 0d6b0cf5a7cd..85a6b7fc6d93 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1632,6 +1632,8 @@ static int ucsi_register_port(struct ucsi *ucsi, struct ucsi_connector *con)
 
 	cap->driver_data = con;
 	cap->ops = &ucsi_ops;
+	cap->no_mode_control =
+		!(con->ucsi->cap.features & UCSI_CAP_ALT_MODE_OVERRIDE);
 
 	if (ucsi->ops->update_connector)
 		ucsi->ops->update_connector(con);
-- 
2.51.0.rc2.233.g662b1ed5c5-goog

