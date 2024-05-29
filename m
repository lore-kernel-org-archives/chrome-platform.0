Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9730715B973
	for <chrome-platform@lists.linux.dev>; Wed, 29 May 2024 05:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716960032; cv=none; b=SQFccuPxq9ncxOgSMFG+g4XFKZRjX131G9e/aG29LE9VPayk0BpNqtHSSqCuHD9mi6+1ZVOvkIGirGZU4Ft7khaglQY+qm/hnoz0dFvEN8a7hAx/SKsyTHaoW+pjQDiy7USFq+z+oT8PhOsS6dwU6M5b3EHkjdi3aSTdZ4C09Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716960032; c=relaxed/simple;
	bh=QKPg0GXrcZzQS4rmZnSp7XRqqO/2NVRV/jM73AorGlI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=RyYbZai4i6ayO5bInhkW6Fl/LFoLSrYbxr6DOHbIXmpNyM4iODoOW+l8AhQTRtfSFHh2tVNuQ9uKs8YUhntRSJ6E7sdA69euVFyp2spkXvqnWMTv2PUMewJGGOJZQNiSIHlaJDkWv9mC6/Sq+BRbsMTW3ZEzDTZLJ9QNAAw+UBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hj5Awd4A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hj5Awd4A"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3A119C4AF13;
	Wed, 29 May 2024 05:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716960032;
	bh=QKPg0GXrcZzQS4rmZnSp7XRqqO/2NVRV/jM73AorGlI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Hj5Awd4A0+9Dy1ffAa7A6CDKrs4TR8kBQzo7F61f8EkRhqcIrT4/93WfQB1uay2sT
	 NxLvmsc++PKEO2D+t0+hEh2Lb05alGFqW/FXn6suSgx+ilTqMrvDaaEoWeyXrC+hxm
	 +Hh+80fkEjtlKCA6OHFdfFChs5Ua/WvlN7Un98hr1bDSebmOD2TL+m6OBYBmcSkvmd
	 qPYAceiBpdMpP84S3fp9YfJ/aihN08MsQutlC8NwVnXUrFxXzKgYgAIsmfxv4Sjfa+
	 RspaBORFYYkCkIIMrAq4OFuJysDmJ4P/tFHXq21nLfZQYHWR4L+j92CmME+N10C9A3
	 Q7DnkILYX76+A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3091DCF21FC;
	Wed, 29 May 2024 05:20:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] drivers/cros_ec: Make log polling period a parameter
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <171696003219.24832.1214279257217685777.git-patchwork-notify@kernel.org>
Date: Wed, 29 May 2024 05:20:32 +0000
References: <20240507155809.525701-1-robbarnes@google.com>
In-Reply-To: <20240507155809.525701-1-robbarnes@google.com>
To: Rob Barnes <robbarnes@google.com>
Cc: chrome-platform@lists.linux.dev, tzungbi@kernel.org, gwendal@chromium.org,
 groweck@chromium.org

Hello:

This patch was applied to chrome-platform/linux.git (for-next)
by Tzung-Bi Shih <tzungbi@kernel.org>:

On Tue,  7 May 2024 15:58:09 +0000 you wrote:
> Make EC log polling period a module parameter. This allows the polling
> period to be set via the kernel command line. Keeping the default at
> the current 10 second period. The optimal polling period will differ by
> board.
> 
> Signed-off-by: Rob Barnes <robbarnes@google.com>
> 
> [...]

Here is the summary with links:
  - drivers/cros_ec: Make log polling period a parameter
    https://git.kernel.org/chrome-platform/c/7b44d5381e54

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


