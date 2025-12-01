Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BFC730BF6D
	for <chrome-platform@lists.linux.dev>; Mon,  1 Dec 2025 12:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764591980; cv=none; b=DX/YISSBJplIX0J2hBI0b1N5F2DclwJ4szxvNd7VH3v4igdoIbUdwvN40bhEsnWrvD9Xrj3yw+7AAew3juJE2nkCl+ka4e+WyMBqlt/IchdTnOEelcpMqEDfPwf4RHyAD5HWiohrqswST1iEpRp39UpmWXYzXV5o6+EhmUOC9do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764591980; c=relaxed/simple;
	bh=6VDUNhFKjIyxAfmAoMmcN/eMripBuE0sbN890k7u5Co=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uGiesR439jDBrphwH7CeVCr010fX3Ls/ArlMN8wMyuvlbjBzGdAL7tke4rz6SrWEjKP6JWSXT1ScNJzVBC24ZVvCf+1Irv9lWUyl4SuyJFKfZTn6wgbocex/XEEisK0OhKpQGDWV+YKyQlI2DUEt5vZ5PXjeWNT/tTubkfkuTBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LSE4xXo5; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LSE4xXo5"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-64162c04f90so7795788a12.0
        for <chrome-platform@lists.linux.dev>; Mon, 01 Dec 2025 04:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764591977; x=1765196777; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OjAcK5jQuv2kklMSEXof63giOR/XCPNAsoShF6a7bVw=;
        b=LSE4xXo59w202BXimf4GPl1RxmGmoWtFE2ORlpdWVy7iwm4kltDcTqISVHGqGuFF03
         eozZh8/3QAeglz18rcikWmhV3/Pwyojgb8rMVQ8Ot7NLA8eahXvSgyRzggKzw1krBlm1
         JTt6JfeIAF+647oIRgL//P6RRZOq6qOCucZFA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764591977; x=1765196777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OjAcK5jQuv2kklMSEXof63giOR/XCPNAsoShF6a7bVw=;
        b=sirXDNut8Nu6VN1eZz8G9GrPU0MehFWkFa9YGy4W7DgK8sDfvlWvTCG91r/yB12zt7
         RiU/N86mIK8R/pG0y5ZIXEulrAKasg1JrwrokBu8LGn4QeAsycqnoU7gSsJz7KJv0xf2
         w5Co9O9XZHnOO6Fuf4AEgmhlL5yggERs8JO8rj47PLGTpikzxKQLmNJsQO7pF8L5iGfv
         VDMCgceNjZN6isf8zNvsZ7ecP9ioBkl1qmos0jOvsIlUfpnC4Nv1L458EaByXL2zJ6KS
         Vg50OU3U5EJ2BxnF1fW6A8ofA9atCzdn3lRppTt4yJ0W3R/8P7uY0K1XhvKVPtMcc3cM
         v0Zg==
X-Forwarded-Encrypted: i=1; AJvYcCUgwZxbv3ad7IYIl7k/YuEvMlGCcmCZb+ko9WiYA/nbiTH7URR6Satc7syP+LK/ewGIZfBKmzwAa2aGHRMKyMQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxJ2rN0uVE1VkINh7bORBDXbX+IoyWds6KXnVKV3nMvhJgyN6Zf
	uvbU6p/80kD/2gaAksIH+pxa3TS6fXAj5xnmin/Y0522jkF724xtJeNDv87hODzz7g==
X-Gm-Gg: ASbGnctmvupGAs8RBJvsmOgLHYs26DJIhKE2DbW79oSxIPLbm+TP44z8/g/xaCUjXcj
	eruMEvm95WQq5OKLqgnzwJG037KvggEFCO5e2rkTnuGTdP+sSPz8qdlwSrxgZqApvrbOWrKy/Bn
	PaANz7R6JbRxT22CGCVDLugKr56wXvNdOrUtEFxNGeJI6XgptQ3lUdvhd+XgWM8dLj7V7N71Ul3
	77wDPZLFkKEkytfd+DhmBHPYl3WTH2g0ouotTdINSYo8uM3rYN8C78BHbUaX5I3f15rXwhMCkBj
	bmAwIIZGUjLSOsm+MvsFJCV/Pwwc9/j1Hh41S59bFZ5/PARglHjlhkr0VGrGPx0Ruhvru6A+MWn
	j9tsma0kuU4/O90fuoO4aS0B7xcnfBy1RQ/gb6891JvmUBnDv6is+vkB7nV7al9oB5htJfUsYtY
	O4ZMT+2aQPGmK1GCEbtbiNfmsW0sM7lNZb8IYebRp01Xe9CqlmOr/16unFQfblwmVj8PfzWYhZn
	UNeKzFv3sM=
X-Google-Smtp-Source: AGHT+IG3kfMAbGwiNdUyy1C0roJ6R6b1shoAdCyb+csyZ1jwsKMGfN9QjFVoFo8tRijm4LmBgMo8uQ==
X-Received: by 2002:a17:907:6eaa:b0:b71:854:4e49 with SMTP id a640c23a62f3a-b767189cf54mr4375094666b.56.1764591976789;
        Mon, 01 Dec 2025 04:26:16 -0800 (PST)
Received: from akuchynski.c.googlers.com.com (218.127.147.34.bc.googleusercontent.com. [34.147.127.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f519e331sm1229049266b.24.2025.12.01.04.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 04:26:16 -0800 (PST)
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
	Abel Vesa <abel.vesa@linaro.org>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Pavan Holla <pholla@chromium.org>,
	Madhu M <madhu.m@intel.com>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH RFC 2/8] usb: typec: Integrate USB4 into the mode selection process
Date: Mon,  1 Dec 2025 12:25:58 +0000
Message-ID: <20251201122604.1268071-3-akuchynski@chromium.org>
X-Mailer: git-send-email 2.52.0.158.g65b55ccf14-goog
In-Reply-To: <20251201122604.1268071-1-akuchynski@chromium.org>
References: <20251201122604.1268071-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

USB4 is defined as the most preferred mode and is placed at the top of the
mode priority list. This ensures that if the port and partner support USB4,
activation is attempted first.
Activation is handled via the `enter_usb_mode` function. System control
(enabling/disabling) over the mode is exposed through the `usb_capability`
sysfs port attribute.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/usb/typec/mode_selection.c | 27 +++++++++++++++++++++++++--
 include/linux/usb/typec_altmode.h  |  2 ++
 2 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/mode_selection.c b/drivers/usb/typec/mode_selection.c
index 1cf8a4dcd742..957e09813831 100644
--- a/drivers/usb/typec/mode_selection.c
+++ b/drivers/usb/typec/mode_selection.c
@@ -74,6 +74,7 @@ static int mode_selection_activate(struct mode_selection *sel,
 
 	__must_hold(&sel->lock)
 {
+	struct typec_port *port = to_typec_port(sel->partner->dev.parent);
 	struct mode_order order = {.svid = svid, .enter = enter, .result = -ENODEV};
 
 	/*
@@ -85,7 +86,14 @@ static int mode_selection_activate(struct mode_selection *sel,
 	 * interval.
 	 */
 	mutex_unlock(&sel->lock);
-	device_for_each_child(&sel->partner->dev, &order, activate_altmode);
+	if (svid == USB_TYPEC_USB4_SID) {
+		if (port->ops && port->ops->enter_usb_mode)
+			order.result = port->ops->enter_usb_mode(port,
+					enter ? USB_MODE_USB4 : USB_MODE_USB3);
+		else
+			order.result = -EOPNOTSUPP;
+	} else
+		device_for_each_child(&sel->partner->dev, &order, activate_altmode);
 	mutex_lock(&sel->lock);
 
 	return order.result;
@@ -236,7 +244,9 @@ static int altmode_add_to_list(struct device *dev, void *data)
 int typec_mode_selection_start(struct typec_partner *partner,
 	const unsigned int delay, const unsigned int timeout)
 {
+	struct typec_port *port = to_typec_port(partner->dev.parent);
 	struct mode_selection *sel;
+	struct mode_state *ms;
 	int ret;
 
 	if (partner->sel)
@@ -251,13 +261,26 @@ int typec_mode_selection_start(struct typec_partner *partner,
 	ret = device_for_each_child(
 		&partner->dev, &sel->mode_list, altmode_add_to_list);
 
+	if (!ret) {
+		list_sort(NULL, &sel->mode_list, compare_priorities);
+
+		if (port->usb_mode == USB_MODE_USB4 &&
+			partner->usb_capability & USB_CAPABILITY_USB4 &&
+			port->ops && port->ops->enter_usb_mode) {
+			ms = create_mode_entry(USB_TYPEC_USB4_SID, 0);
+			if (!ms)
+				ret = -ENOMEM;
+			else
+				list_add(&ms->list, &sel->mode_list);
+		}
+	}
+
 	if (ret || list_empty(&sel->mode_list)) {
 		mode_list_clean(sel);
 		kfree(sel);
 		return ret;
 	}
 
-	list_sort(NULL, &sel->mode_list, compare_priorities);
 	sel->partner = partner;
 	sel->delay = delay;
 	sel->timeout = timeout;
diff --git a/include/linux/usb/typec_altmode.h b/include/linux/usb/typec_altmode.h
index a240d8264b92..faf72e4d6ceb 100644
--- a/include/linux/usb/typec_altmode.h
+++ b/include/linux/usb/typec_altmode.h
@@ -9,6 +9,8 @@
 
 #define MODE_DISCOVERY_MAX	6
 
+#define USB_TYPEC_USB4_SID 0xFF00
+
 struct typec_altmode_ops;
 
 /**
-- 
2.52.0.158.g65b55ccf14-goog

