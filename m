Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509592054F1
	for <chrome-platform@lists.linux.dev>; Thu,  9 Jan 2025 22:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736460422; cv=none; b=PdSijWfGML0Juf6faipXr/aC8zRvq2lYsMk4lApBYziOXrHPU2ZBNQYpj7vjGvrdUiYaJ+wCsBloK1omWiMQ7x8WxNUXsHQGDVcq0rEykzLr3+aH133RlMKVx/7+4PJ/FKQwauFFuV0Z2EpgjmntGMmOoTrhCk1hQ65ZMzqyHaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736460422; c=relaxed/simple;
	bh=16103WdjKkDRPAUpJv/gja+j04dR9xW9d/edeY7WQjc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=otLjaYN/2WMMt3p/Wy9nxtTn6FlCZqh/zXICoj6IcQucfkqYcS3w7ZIC5u9F0w5MWmeBzmDA78BZ6CUtEbg6IgWOOghmbLEoot0PdeOGiq+38TmLKBFu6HiXg5y7fnix7Q9Pjah3ffsd5XZLJ8GZ1qPPnMNlP+4ixvre4kAv9J8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dvbOhfmM; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dvbOhfmM"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-21661be2c2dso22027265ad.1
        for <chrome-platform@lists.linux.dev>; Thu, 09 Jan 2025 14:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736460420; x=1737065220; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gXlckJ6SpwsTGpU1oM+HpGRrggJSHrz/QlJTly2bc/Y=;
        b=dvbOhfmMWjSLAwvAJ6HJNLHHub/vbHA44B+dZF4FYOs9ggLsvaewoHLgk0i4wCx0l0
         shLJTZODmCAMLqlTz9aM0iWzF4T/Su3e/Kz4YgpOwwoZxcOZzZj0w15MFnmcLW8WSTsi
         cTBRAVuxJxeHfpPpqQ5ZOQLB9Mwot7Mz+N7UY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736460420; x=1737065220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gXlckJ6SpwsTGpU1oM+HpGRrggJSHrz/QlJTly2bc/Y=;
        b=nKhkKhWMg/3SKMnF8J6IfhyuiZt9/f9jUrvy3pyPOP5yHRIrnoLQEqKFPB4O4fGfJK
         WDoMGS8evIVeiLw1qpaSORF6mnMRTtjl57riKs3wHcMN8fIYYw0vu1RfeHvyWbv+bBOF
         YF+J6jVXT8pguZ0IE5C38CjRWv/nSzRO4Gl66KPsob7Nsoez8gsxnbeFIHDG+XnM6qHk
         tTkeyUTVyd9uf9IeCUL/Bis3lho5u63t/gx1I7aPjBxB/GXFkpfYpmw31yakKb0JItiT
         BQ8KGxfmPJe3/i0bvaPgS3uP5aWAj2zj4UfO7Dy4UxjpNtQ/ZURWKRxe8r4xotjAgp5E
         PSQw==
X-Forwarded-Encrypted: i=1; AJvYcCWf9ikqH6PfO9ah0fsWsKMVATfpidxOPZvTutWi9M9Qn36EewDrkxUo8KwR8FNC5dzwXn8Nz77ZbPvV/5GRxRQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyr5LhkU0liIa5d8IKSSn5tSYcA+oZHy8AAOJkhXw0Moz3bY+gX
	kLa2kckqmFJUMn3alXeD2+mZ8g0fZUTFt/aGkXhvF+fN1XbUi3EPLSfpVaz54BZW0fwit+/NRI8
	=
X-Gm-Gg: ASbGnctPCinIJNduwg3Rp84VdCpBk5bU5O+6iSamrq1NG1f6rS3CuXg5RA3iKx/SlNQ
	9ER/EfmnLquhbT0rgUzmkGu0kI7PsAeYAw7DggEZBk03A7LXf8MnyJItX6a/J5ydmiNwHBU4XLE
	w+z79MNCf1VtYBGqmsDRavDF58N3YXQh24BCRWxxJge7FYGsn6amZyj58YtWOjyf2kJtMAVXl+L
	UUZcCm9N4gH1SfTQ4Fo9vrOfyz04Di9R7367/9rYImpu06fgfOljf9JNAufXbgf0BuoDavBW1yx
	zGtSZV5fLeqFKv9MPg1T
X-Google-Smtp-Source: AGHT+IFHTcniOS4ymC+7O/d+cYlP/uXsl/KBs0vwkT5Jh/l8n+3KRvnZGRy97PfSYyRO9sv8ZtFVgA==
X-Received: by 2002:a05:6a20:a10e:b0:1e4:745c:4967 with SMTP id adf61e73a8af0-1e88d0dfa1dmr13487894637.3.1736460420526;
        Thu, 09 Jan 2025 14:07:00 -0800 (PST)
Received: from localhost (129.135.125.34.bc.googleusercontent.com. [34.125.135.129])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-72d4068178csm291404b3a.148.2025.01.09.14.06.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2025 14:07:00 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	Benson Leung <bleung@chromium.org>,
	chrome-platform@lists.linux.dev,
	linux-usb@vger.kernel.org,
	Pavan Holla <pholla@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>
Subject: [PATCH 2/2] usb: typec: cros-ec-ucsi: Mark cros_ucsi_ops static/const
Date: Thu,  9 Jan 2025 14:06:53 -0800
Message-ID: <20250109220655.1677506-3-swboyd@chromium.org>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
In-Reply-To: <20250109220655.1677506-1-swboyd@chromium.org>
References: <20250109220655.1677506-1-swboyd@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This structure isn't used outside this file and can be marked const so
that it gets moved to read-only memory.

Cc: Pavan Holla <pholla@chromium.org>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Cc: Łukasz Bartosik <ukaszb@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/usb/typec/ucsi/cros_ec_ucsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/cros_ec_ucsi.c b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
index 75646a8d55be..c605c8616726 100644
--- a/drivers/usb/typec/ucsi/cros_ec_ucsi.c
+++ b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
@@ -133,7 +133,7 @@ static int cros_ucsi_sync_control(struct ucsi *ucsi, u64 cmd)
 	return ret;
 }
 
-struct ucsi_operations cros_ucsi_ops = {
+static const struct ucsi_operations cros_ucsi_ops = {
 	.read_version = cros_ucsi_read_version,
 	.read_cci = cros_ucsi_read_cci,
 	.read_message_in = cros_ucsi_read_message_in,
-- 
https://chromeos.dev

