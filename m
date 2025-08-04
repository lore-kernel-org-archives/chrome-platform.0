Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B154A246768
	for <chrome-platform@lists.linux.dev>; Mon,  4 Aug 2025 09:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754298282; cv=none; b=JegElxrvptfKrY9ivAxyhX7yD4cY/akOd6PJsdvWEn3mYN5Qa+6YVhXf7+NZgdigOPzKRg7zdTVFwiZ/also1wjfyQ2U1niQ65EhxS0YrR6p6UFMjew2upmjaXgR8o6WspBzGTnrGd1217Js5UZExiAavM4nDTV1ITaAIhKdXas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754298282; c=relaxed/simple;
	bh=lGxWrmyJi7QQe0IzSfeCLytqae6M3U2caSjouup0SQ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FlD0aAAwWYMXosb/moXCPP/Vt4L/8HrqSxkGehhChix8O/KBiDeTmgYIuswlXhpoeXzYpFYirbX0rTtTtuPBKI8Yfyz0lqpU4zSPR/7Ln7VTDDbfbgvOLyQ9myLEWCjpaQa6yBBppTQa0SJ7Bbq+KR6GBOv10BYwoblzDaPQi18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TJ1PyLvc; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TJ1PyLvc"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-af968aa2de4so117526166b.1
        for <chrome-platform@lists.linux.dev>; Mon, 04 Aug 2025 02:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1754298279; x=1754903079; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fwNnM2nFXT5vCpq6GQAtc8w4BljRfhoqKtZx8NfXTfY=;
        b=TJ1PyLvcWE+5x+ddS2NcwhKBVHEbRlxhLYcM3x+ALW+N5xhyC4KEZ4U6ZyFSEYGDBv
         dahysCRnYPTZCx3GkE/9DdZemNXCd2QQKvlneTBmOj5Ruci2eYRIQUFejHGGIt/9gG4P
         eCyRSecB0Qw3q7kFCJyhGahlGi4VSpnoItszk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754298279; x=1754903079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fwNnM2nFXT5vCpq6GQAtc8w4BljRfhoqKtZx8NfXTfY=;
        b=Qif923rywLL4UrqkLz1YMwsoAdPKqwjBcfPDexdDZh3kA3A0SQRvILsk/yh0/2BLIT
         ORAFyVAz8VaOxGuPrVokxka8jF42cirvVFGBUXSbUz2GjhG1kC6U8E088dKmY+3iQ1wD
         o1geKCR3zrtr/oJeXB0H6Rw77tmmbC3Zk9wch8OV7oXPzqLlV8H6+sjo0xxTuuugd12g
         O8NhL6aMbn+URScNoaJalewcRRAP+Ln1unmnv5iRutCPA0r0il1RVtVDFSlSnJvThqaM
         pWBkse4Vj82qOd6wb8CV3G7oObfGn5X+zUM/w8RFpsmsg67gPxNu3dXaxxF3gTqMcPyD
         4Chw==
X-Forwarded-Encrypted: i=1; AJvYcCVaXdYH5VofcMrNTW4ViPbJSje7YM1+lx3KND3B5GsLff+wgrN7sRibZPi9IefbbwBjq8Q6174o+70mTIcqlE8=@lists.linux.dev
X-Gm-Message-State: AOJu0YzsfgC0CtOeuwI9xMEIr3mdbrArhqQ8Q+uU8IRzPkZXfUrCkq6A
	9HO5ZOXQt/hQyxpisXHOcIKwzeTeN4kAkwv/s5HXohwx27CMHrQevWpMiYtypw2oLg==
X-Gm-Gg: ASbGncvIrbYiDTLK+3xuLu0Y/bCvJBTqvkD81UMRA7GLW3QpgJwTFIcpa2a5C/01kEh
	GK6Dism+B/X+NADnp0Rl84PiLUlMJ9WWhnJUC9qx36WQu6dAa5AvOBNcuJqxzXML+OMb8j8zQE/
	A15UpeC76zmUHpeHErPLvp2uDtipYQeUqySZzcQqnCRmjpDARRaPPq1tP2A+9HDtdA6i1R6NWd2
	w2isGznXFn6LPfCD2ZF6BYcORJXgQfJveE3VZy2usWaTS9E8rrw1iDxji2AglLgcPKl5c/aJzDi
	ukR/yMqP4SgL6Dn9CwCk6GjodaCNa7s7l0S6InqIdW8IlzRHCmiG6McejpS1dq6YRcZaPkD/Jcw
	AWntwpp6OVGAB9RUWNemqYukWviBgJmziOBc1aouQlvMZFSzedCtm/5LA4N2G+a9a/Qx9JCwrM1
	VgY9DOzfkh2lnriLY=
X-Google-Smtp-Source: AGHT+IFDY6Eti/U0HvJUllLufsYb1TLIXF6CEqk3Nsb18AYq8jRe68qPhRYRsXxRYg9IeMMo3fetyA==
X-Received: by 2002:a17:907:7f0f:b0:ae0:ded9:7f31 with SMTP id a640c23a62f3a-af94001f8dbmr979021766b.20.1754298279104;
        Mon, 04 Aug 2025 02:04:39 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (150.230.32.34.bc.googleusercontent.com. [34.32.230.150])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8fe7995sm6412790a12.36.2025.08.04.02.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 02:04:38 -0700 (PDT)
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
Subject: [PATCH v3 07/10] usb: typec: ucsi: displayport: Propagate DP altmode entry result
Date: Mon,  4 Aug 2025 09:03:36 +0000
Message-ID: <20250804090340.3062182-8-akuchynski@chromium.org>
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

Reporting the error code via VDM back to the Type-C mode selection logic
allows the detailed result to be propagated to user space.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/usb/typec/ucsi/displayport.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/ucsi/displayport.c b/drivers/usb/typec/ucsi/displayport.c
index 8aae80b457d7..47c28646cfa9 100644
--- a/drivers/usb/typec/ucsi/displayport.c
+++ b/drivers/usb/typec/ucsi/displayport.c
@@ -234,14 +234,18 @@ static int ucsi_displayport_vdm(struct typec_altmode *alt,
 
 		switch (cmd) {
 		case DP_CMD_STATUS_UPDATE:
-			if (ucsi_displayport_status_update(dp))
+			dp->data.error = ucsi_displayport_status_update(dp);
+			if (dp->data.error) {
+				dp->vdo_data = &dp->data.error;
 				dp->header |= VDO_CMDT(CMDT_RSP_NAK);
-			else
+			} else
 				dp->header |= VDO_CMDT(CMDT_RSP_ACK);
 			break;
 		case DP_CMD_CONFIGURE:
 			dp->data.conf = *data;
-			if (ucsi_displayport_configure(dp)) {
+			dp->data.error = ucsi_displayport_configure(dp);
+			if (dp->data.error) {
+				dp->vdo_data = &dp->data.error;
 				dp->header |= VDO_CMDT(CMDT_RSP_NAK);
 			} else {
 				dp->header |= VDO_CMDT(CMDT_RSP_ACK);
-- 
2.50.1.565.gc32cd1483b-goog

