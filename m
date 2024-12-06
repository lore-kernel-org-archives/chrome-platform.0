Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D16212FBB
	for <chrome-platform@lists.linux.dev>; Fri,  6 Dec 2024 23:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733528330; cv=none; b=Lfr66d/aKoGxVS2/mz8mWN8mnOTgBNxjvgIN6cFuwGChy7SzRNnNmIQQDMZP+MOgCYjW/QRB7AHOo6nIft4AB9s+qq47GdEEuQbtRDkbpotYbxRptteZNL3MIL7NVLaFzwMsYgucdf/KL/X9pxyDbUS/sjmaQqCkq9i25SzcWJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733528330; c=relaxed/simple;
	bh=Jlz35Axmxas20UXZdMUAEnU/Zcdy+VnrtwvvujZhzjM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dnxtx8bnxKD92V/aSyg88klRilv4zQlP0so9N4sYn0UDzFcO6wKavOy6KuH1FFdffvcGFy+HLzEBjV+SyoPX15lT0o+ujIEA5TsidadkyMkg7VuqH4PXsyipB/pKAwoSgI975w/IEo+sdnQcM1ygT4n3xPPiiw7VVvC5vw0AGsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hiyTi60P; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hiyTi60P"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-725c49b5e45so829825b3a.2
        for <chrome-platform@lists.linux.dev>; Fri, 06 Dec 2024 15:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733528328; x=1734133128; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qEsFgZZBOjZItw/w6Re8IWK1gazviV9TFZpIsGLgdzk=;
        b=hiyTi60P9eJ2LMv3LsNeEawvmfMF8dkXhvGLzBl7zylNBqmk8ORB8OtfbF+hMCbNXQ
         tgkOGheRM+18ARvcAHGufp0GNlgKl/7OJsV70xazqToh1ttcYlVSr4yYRc7pEeJ80sD9
         awe7Vd+b/YZ7sj2eziiOuSYg5sE+etnDAULWQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733528328; x=1734133128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qEsFgZZBOjZItw/w6Re8IWK1gazviV9TFZpIsGLgdzk=;
        b=Rde9HKRnTJ9jaXbqYSMp9R6Wmm7OOH7JAnbaVGdOf8XDeBTABJjl3uwOsXI4oWVlru
         AuFhSnjjyOOMOl9vSzFQk+PBonHLyFLz/yf4BX07HHXckkqvxi/Pwtej4PYGG4B/SScr
         jlUpKiXu1qUV34rOB/7GlDF44bbYQZpgSCaOShwFqmWPc6S5wQlOocDx7+zVhZ3y8fqW
         rvkL3D2J7lDOUeY2PF8c5CWxjUS2xVdCsIhN5cBi1IW6VK24a8+rXuJG3YwM8JP4ndBu
         5lMXwKSm6ojQfO8x1rKmhmlgC7C6oJjV/OdlLHp3IBFXe1niAB2CdIH5b40lVwct5XEF
         GIeQ==
X-Forwarded-Encrypted: i=1; AJvYcCULZZNfl61TGNnU9/wsBXDnYQDIXLDuGDv5tXsCA74kxv5MheuoSuNzh+mCkiPkWaBcsuDURa2MOfvpJgcLcU8=@lists.linux.dev
X-Gm-Message-State: AOJu0YyOVKDo1a8I1vKkiruRDj/E11N6uHf6DAALRchhOGI9SvpIQ8iM
	YFW9CmrC1c8wMhaFLLadUIKYiYHD0iNR4TcVeLfHHxiyn2GkheU/T6SanYPi5w==
X-Gm-Gg: ASbGncuStf4lTHeGT0vVp/1oL0vWDSKVQ2CQbvOAiM3wQX3en1Utn1/WiFKa0X9psd6
	XYc26rib7cK0DDKtCK6xpnR+HBviBSYrEIw8g41BbzYB6FHkQOd3NVXfgsGqIqzjogXYTdDDIxD
	TPXGt3QFx1bCvQxbDfHHTIydlNun5D/c6WKgPsnAa0FusfipKlZnDQBBLMfZKudDebpyhcO4bUB
	hHMluVbYwQMyeyjPAq8sKclk0dSpfazxT24LDwPKhxaS469cksAR6INoEMfHjrKUvkcge53RCOg
	oXNt3s+wuCC3YUrOcRmG0Y3n
X-Google-Smtp-Source: AGHT+IE2s40s6YYwYc1sTeIXRAHidUXahuDrUL8yJczv/cBkFhoKl7A5wKj7RNqs4UHrL++1LK1l/Q==
X-Received: by 2002:a17:902:e5cd:b0:215:9642:4d6d with SMTP id d9443c01a7336-21614d3ac8amr54953465ad.17.1733528328424;
        Fri, 06 Dec 2024 15:38:48 -0800 (PST)
Received: from localhost (227.180.227.35.bc.googleusercontent.com. [35.227.180.227])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-215f8efcc70sm33915095ad.167.2024.12.06.15.38.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Dec 2024 15:38:47 -0800 (PST)
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
To: heikki.krogerus@linux.intel.com,
	tzungbi@kernel.org,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: akuchynski@google.com,
	pmalani@chromium.org,
	jthies@google.com,
	dmitry.baryshkov@linaro.org,
	badhri@google.com,
	rdbabiera@google.com,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/7] usb: typec: Print err when displayport fails to enter
Date: Fri,  6 Dec 2024 15:38:14 -0800
Message-ID: <20241206153813.v4.3.I6cff9d767b0f8ab6458d8940941e42c920902d49@changeid>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
In-Reply-To: <20241206233830.2401638-1-abhishekpandit@chromium.org>
References: <20241206233830.2401638-1-abhishekpandit@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Print the error reason for typec_altmode_enter so users can understand
why displayport failed to enter.

Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
---

(no changes since v1)

 drivers/usb/typec/altmodes/displayport.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
index 3245e03d59e6..e292780ec309 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -252,7 +252,8 @@ static void dp_altmode_work(struct work_struct *work)
 	case DP_STATE_ENTER:
 		ret = typec_altmode_enter(dp->alt, NULL);
 		if (ret && ret != -EBUSY)
-			dev_err(&dp->alt->dev, "failed to enter mode\n");
+			dev_err(&dp->alt->dev, "failed to enter mode: %d\n",
+				ret);
 		break;
 	case DP_STATE_ENTER_PRIME:
 		ret = typec_cable_altmode_enter(dp->alt, TYPEC_PLUG_SOP_P, NULL);
-- 
2.47.0.338.g60cca15819-goog

