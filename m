Received: from mail-dl1-f73.google.com (mail-dl1-f73.google.com [74.125.82.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2DAC352F95
	for <chrome-platform@lists.linux.dev>; Fri,  3 Apr 2026 22:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775254989; cv=none; b=GqgusRy6iz1+R99os/EF8UsEriTqmbAVK3UAjVGjOXXII4YaXQwnHAWApPFMsdPQavUm4WFtlo3N1v0JkjmItX2r+rTqt7OGywEVpjeFuYzhc+3p1rtS6E8sF69Pdz06lAmFkjPM5EBYDKtSl0Ex2MbZP1KJixSfaTWbfUI/ZP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775254989; c=relaxed/simple;
	bh=DTPbWoBdj3ITyC59INUXCfyaHcKW2JnlRHow8+3WGa8=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=ABY4UFOmX4lcSpupVjEO1Ur/gY4tfx1oljpgXE29/25gDL8WEJH4vz2HoSjJTiKUp0wRBJiXvNB6dRe7K/T7fkuy2yLpiF+enQ3qIeRt9ClQH/4IyxKKDjzDHRG//uLNUVfO6pt84LyIHjw76sM9RklwE/S90eDI69q9LtF4Gqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ps9rrdP7; arc=none smtp.client-ip=74.125.82.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ps9rrdP7"
Received: by mail-dl1-f73.google.com with SMTP id a92af1059eb24-1279caef718so3785352c88.1
        for <chrome-platform@lists.linux.dev>; Fri, 03 Apr 2026 15:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775254985; x=1775859785; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fUdkP1vdiFBC+2oQIMRNTR4aHhwBmQrWAidHoAxs6aY=;
        b=ps9rrdP7Qgz2raHyxIljjOfHZ1aVwN4RVqWV9E4PT8nJm0WklFckllygO5+BHAyvMo
         n0YeSfXsOiqQAqlyYy63h0KuwBzlByVQecCxegWHTM8yY2LVz2crDjG40bmIN4l3VnNl
         aKPG7vwEIg3RDYPjkvJUAZEVT90eqtUIDpIicyLCycfHg1iZ5nJCTeky5YRZ67Pul0u5
         QBBNq/QfDiPXn5j/bq49P07NvY1q1h7a7rW9teSnQdQKtm45ASncafSRQBKcHNA0FZsU
         M4d0LbnU1XyJbVb2d2a9xIe5FD7zuSCMwr3w1AkJ5zuudUv1rpLmwK0/S7EW4BGACO1S
         pwJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775254985; x=1775859785;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fUdkP1vdiFBC+2oQIMRNTR4aHhwBmQrWAidHoAxs6aY=;
        b=Z4IDXHgEWkEjBmXfS4TN1/e6amcmkjpEECN9GGdHuVqBE9YpvpzGnY/wQW9L4x9std
         NL4o31Bvch11r1+v2eylputHGh0v/OZM4paqJcOcRzKiZfwIkUl6bJl8YIqNRmex39xW
         D6yxL33XM4FA+PO81WEn0IS7IwXpYFguRNcplioj07HJCTriWLl0liiLvnOljnZK9gKb
         lNTZOtvPtn4ubRGbzUjC3whvBoBKJeH2502jYWah2dahALrrLqQE4wpkQCVZNuCOYJ3e
         4enAjOjJDo9qHC5/n8RR/s6L4245GOTgSgwegRmcUmgVeOdF1T0P1TrIRtKXnQIQUEFF
         HP0w==
X-Gm-Message-State: AOJu0YysdNVSy+JXIzXWJVl8iV6mhddAIuE3vo+t2H7RPHV+Wgkhv+nu
	TeiQsjgpLZiqdlSUcOVPX2SV9+fq9U5V7ENxfD711DePP1TdDyZUPDQY9qelw3zxuhcSSnYgBYZ
	8ctkcyg==
X-Received: from dlbsv6.prod.google.com ([2002:a05:7022:3a06:b0:12a:8256:66b9])
 (user=jthies job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:eacb:b0:11b:ade6:45a7
 with SMTP id a92af1059eb24-12bfb6ec894mr2047940c88.1.1775254985143; Fri, 03
 Apr 2026 15:23:05 -0700 (PDT)
Date: Fri,  3 Apr 2026 22:22:52 +0000
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
Message-ID: <20260403222253.1888991-1-jthies@google.com>
Subject: [PATCH v1 0/1] Check for UCSI fwnode in cros_ec_dev
From: Jameson Thies <jthies@google.com>
To: lee@kernel.org, bleung@chromium.org, tzungbi@kernel.org
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	abhishekpandit@chromium.org, akuchynski@chromium.org, ukaszb@chromium.org, 
	Jameson Thies <jthies@google.com>
Content-Type: text/plain; charset="UTF-8"

Hey everyone, 
I sent this patch as part of a larger series in late 2025 which hasn't
merged. The initial series modified dt-bindings, mfd and usb subsystems,
but had not been reviewed by mfd maintainers.

For context, here is the previous series
https://lore.kernel.org/all/20251013203331.398517-1-jthies@google.com/

This is only the mfd portion of that series, it builds independently.

Given the time since this was previously under review (~oct 2025), I've
cleared the existing review tags. Please take a look and let me know if
you have any questions.

Jameson Thies (1):
  mfd: cros_ec: Don't add cros_ec_ucsi if it is defined in OF or ACPI

 drivers/mfd/cros_ec_dev.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)


base-commit: 168e4b208ca8c2e04de20cc6cb7e2fb035dc1ec8
-- 
2.53.0.1213.gd9a14994de-goog

