Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0758232C68
	for <chrome-platform@lists.linux.dev>; Thu,  7 Dec 2023 09:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rdbabiera.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rIAp9/Xf"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-db54c11887aso935114276.1
        for <chrome-platform@lists.linux.dev>; Thu, 07 Dec 2023 01:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701940093; x=1702544893; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HcBBD4Ve+EnK0sA+7Oy5D//EjO8x9y3uJFnX5ru4dqg=;
        b=rIAp9/XfpmlhSnX4gMdzGJzqHbvd5vM88yyuFJFBJpTN9Wy/abYCBG7fzcggM1i9zK
         Hod8rfTKbocSFnQWSoE4PZUPa+VQyBRrTS0YNnzdkGlQDTJjgDmrLkfSOih0a9nkTP2J
         x+TXKgaIOKDQgwkZ7g1oLDNTRXYl0dPSQOCbyh1CJu0841a8nk0/1UWevjfPfSlSalC5
         G8IeOhq+t3bShrLWfOg6cLv+O1nFyauPBiVDxXb4LxHFhhoTk4pNOKOBGxwdQJ3O3NeJ
         HphdQ9VFHT8SvzGFYMBPHv8nVqDh7SXZrzVKX49088S3X4cTnPYuuGc6aDRH8nkzx7g3
         cWlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701940093; x=1702544893;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HcBBD4Ve+EnK0sA+7Oy5D//EjO8x9y3uJFnX5ru4dqg=;
        b=fw4wX4UH3N9nA18oLlrGj1HWUtWs0zmmcqxv5D97uwG5kuIW2nFgIsRRH9j+BGTiLV
         PbB9SX2tR5TE6jCZUZ9PCSKeJZ/fc97ZBWW9Yb8Ldl2qRr7Jm5CYwzIx7qjP/JOvWpMB
         xYJk1ZTnGF90kGwS/YlQbrdakI5Wy6m4tOPREs7bkxGES5mONZYIhwb++e0nnHf1Olvy
         ESaUV1VyrzqhfvxMunyNFQ+xSFIfQ+008EEWmtPUlPPzzFrpcg6lDRSW/OCIDPTb9wJH
         CjBCWyoxHprRlHPNk1rqlyY2ClePeZvVcfuZ5x0fcJGcHDOuS7v7K0CBxbh8CRnNX9op
         SnUA==
X-Gm-Message-State: AOJu0YyVBekHzNm/4cKOsCoMvEBHVWLDzxr7L9MCz0gzmWlsg6xovywW
	bjk9+qjDgxaZjZ/xGw11l3FdFqqGHIt0vig=
X-Google-Smtp-Source: AGHT+IEqB/j07MaxmdfrGiH6cpjewMzzjxAe0aX1PjsLmlRZovJi+MS6ODabqF7RJKBqphBvuoBj2o30uU2WZ9g=
X-Received: from rdbabiera.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:18a8])
 (user=rdbabiera job=sendgmr) by 2002:a25:ca92:0:b0:db5:47c1:e82d with SMTP id
 a140-20020a25ca92000000b00db547c1e82dmr25759ybg.6.1701940093019; Thu, 07 Dec
 2023 01:08:13 -0800 (PST)
Date: Thu,  7 Dec 2023 09:07:40 +0000
In-Reply-To: <20231207090738.15721-12-rdbabiera@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20231207090738.15721-12-rdbabiera@google.com>
X-Developer-Key: i=rdbabiera@google.com; a=openpgp; fpr=639A331F1A21D691815CE090416E17CA2BBBD5C8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1088; i=rdbabiera@google.com;
 h=from:subject; bh=Go8QEr2NQzBwcUwozRZWWtLanmmY65Hze1InDnkaM4E=;
 b=owGbwMvMwCFW0bfok0KS4TbG02pJDKmF3XGTak3qtp3775Bx7lDlfW9pvog9Gps3eD66ctWcI
 UTu/wyLjlIWBjEOBlkxRRZd/zyDG1dSt8zhrDGGmcPKBDKEgYtTACaSbc3I8D56Tv+fy5e8F1y8
 UHys9lNUUx1X6rJnZ1dtesd5oCVKKJPhn62M8nfGR7/9De/2LjC8UpU5w/h/+G3xeLMbPhP/rL8 XyAUA
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
Message-ID: <20231207090738.15721-21-rdbabiera@google.com>
Subject: [PATCH v1 09/10] usb: typec: altmodes: add typec_altmode_get_cable_svdm_version
From: RD Babiera <rdbabiera@google.com>
To: heikki.krogerus@linux.intel.com, linux@roeck-us.net, 
	gregkh@linuxfoundation.org, pmalani@chromium.org, bleung@chromium.org, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org
Cc: badhri@google.com, tzungbi@kernel.org, utkarsh.h.patel@intel.com, 
	andriy.shevchenko@linux.intel.com, RD Babiera <rdbabiera@google.com>
Content-Type: text/plain; charset="UTF-8"

Add typec_altmode_get_cable_svdm_version to return the cable's negotiated
svdm_version.

Signed-off-by: RD Babiera <rdbabiera@google.com>
---
 include/linux/usb/typec_altmode.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/linux/usb/typec_altmode.h b/include/linux/usb/typec_altmode.h
index 4d527d92457d..1ad581c5a930 100644
--- a/include/linux/usb/typec_altmode.h
+++ b/include/linux/usb/typec_altmode.h
@@ -156,6 +156,16 @@ typec_altmode_get_svdm_version(struct typec_altmode *altmode)
 	return typec_get_negotiated_svdm_version(typec_altmode2port(altmode));
 }
 
+/**
+ * typec_altmode_get__cable_svdm_version - Get negotiated SVDM version for cable plug
+ * @altmode: Handle to the alternate mode
+ */
+static inline int
+typec_altmode_get_cable_svdm_version(struct typec_altmode *altmode)
+{
+	return typec_get_cable_svdm_version(typec_altmode2port(altmode));
+}
+
 /**
  * struct typec_altmode_driver - USB Type-C alternate mode device driver
  * @id_table: Null terminated array of SVIDs
-- 
2.43.0.rc2.451.g8631bc7472-goog

