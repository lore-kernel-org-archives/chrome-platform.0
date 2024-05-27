Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721841A2C1B
	for <chrome-platform@lists.linux.dev>; Mon, 27 May 2024 03:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716779430; cv=none; b=piKY+Yj5QbpoumGsooTnZVgMWWThEIZ4xGfnFi4kIB7ESocrzlXAhC9bVHwq0beLsvnKn1p86k6AyLjZHT2JMp7yNT0QMJtxZfGP3a6FBUXkWdbIMP5hdPKIJ8gJ1kWHTHoHLYVNncDoQ+oBQKpzmo7pFacodiV3D2gaw5us9aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716779430; c=relaxed/simple;
	bh=UNuHSPH3MyMNeLptuc2HCpUs1+lkupoTio+1Px1p2Gw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=O9kcK42tVzxTu91EWcwgY6xD6pFFv3PHwfbbTOmhtGtPm9Sc2nc2J2ZzfJ5liw4b3wCMX7LRjmqAFThwdmhR6naIeTuxBvAHoRnM9sqQZSxQtQr36EIs8nZeU+vd58DpHccOuU7X6KZc4RxmyUf0LIiBRUb/UiaGAGkWqhFqolE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KvPvsuf4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KvPvsuf4"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 420FDC2BD10;
	Mon, 27 May 2024 03:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716779430;
	bh=UNuHSPH3MyMNeLptuc2HCpUs1+lkupoTio+1Px1p2Gw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=KvPvsuf4Z2CxDPBlb9oASit5lOZNHuZsNbWjTG605cE2rHOMdORYEjD7anxNR6+xd
	 igopvBJye2LuYolKlWW1k1yfVOa8R83k7O1SwbN3J3OEeyH5R8FXdMOCr9gpsNcOga
	 dQY8drAishGNluvf+JqOBSEnBuqo2tTLiaZRgBJRTr55bKFnUTAaB5yztYt5KeyrbK
	 gWqDh3VL0ruWeX623DHXhIKuc3AySjvxv9Qbzaf3X2jv6Zgg3wRfdOpQ17DdHT+Y1V
	 GpHLSWbadQ9bua+93BV5UUIfpvcSJAl78y9UjYUuCCJxTOHZzrSqm5FrhG8D/3AQrD
	 I9Iqn3mwGfzCw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2F6EDC54BB3;
	Mon, 27 May 2024 03:10:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] platform/chrome: cros_ec: let cros_ec_suspend() call
 cros_ec_suspend_*
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <171677943019.24851.13008138048182860009.git-patchwork-notify@kernel.org>
Date: Mon, 27 May 2024 03:10:30 +0000
References: <20240430020924.610724-1-tzungbi@kernel.org>
In-Reply-To: <20240430020924.610724-1-tzungbi@kernel.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev

Hello:

This patch was applied to chrome-platform/linux.git (for-kernelci)
by Tzung-Bi Shih <tzungbi@kernel.org>:

On Tue, 30 Apr 2024 10:09:24 +0800 you wrote:
> After commit 2fbe479c0024 ("platform/chrome: cros_ec: Handle events
> during suspend after resume completion"), cros_ec_resume() starts to
> call cros_ec_resume_early() and cros_ec_resume_complete().
> 
> To be neat, let cros_ec_suspend() call cros_ec_suspend_prepare() and
> cros_ec_suspend_late().
> 
> [...]

Here is the summary with links:
  - platform/chrome: cros_ec: let cros_ec_suspend() call cros_ec_suspend_*
    https://git.kernel.org/chrome-platform/c/47ef58cdbd7f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


