Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943DB1C6BD;
	Wed, 12 Jun 2024 02:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718159432; cv=none; b=Jt1xSf75YoOddf/rnGAON+dNZF3fUmmkExVNBxkU1c+spw7T7ayR5AdSP4wHoLOYFlXm2c2yzlPlDaVxh+iLRs3ZY+rf0sJIXO9srtv2yv3dRmFp1iVu2eDlZWz+t+iYK2gO4iiEw+35toYGyurQrOW+xvRgFYzL5DoAbZSbOGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718159432; c=relaxed/simple;
	bh=sL68/p5fx9N4glXxswRuEb+CPuAV/pOcY27ovpcXSh4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=LqeYx2LY7bIljh68FI9W9kcEnDwkCnZqqqyEv3UFuPmngMiYXeL0GSLxN05cWLzJBE05KNKPCz5IxHf6p8EOtWe+y25z5c/8vCDaIlmu6/yQihBFZpYb6l7wfz6hNZhqilhoYgVosS1P/Q+7yuE7vFx3dVyk4zznV8V9uaBQvyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S6Rqak24; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S6Rqak24"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 38CF4C4AF60;
	Wed, 12 Jun 2024 02:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718159431;
	bh=sL68/p5fx9N4glXxswRuEb+CPuAV/pOcY27ovpcXSh4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=S6Rqak24B6bsjkx/oJYfiBROfmJGPzlJL+WFlfYs3wg2gej+zK5iaYYA76uPCl+Ip
	 TYx5RYC7hyNdByXgGK6CrlNb978QEwdvtUyRY4fBF9zNAJzjpfSykdyTNav+xtl7EF
	 GeofartLDAJicbmiVVRPcpEQZZhDBHw0aS69H9mjxrFGdaTGpcFyVHOcNn35f+wc4s
	 BcqCVzzbn0HeUsVuRelbXO591P/72k1qrnZXH9MRpPFZ3SV2Tr1lusUINlAkvUQKrU
	 ycq784u39E39IAIKG1p1ntC57D75d6pxXlb6YLrYBC4Xq5ACWui4UTbdZA1keQylWL
	 /HkBdHSpEi5yg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2CCC2CF21FA;
	Wed, 12 Jun 2024 02:30:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] platform/chrome: cros_ec_debugfs: fix wrong EC message
 version
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <171815943118.29023.8712192231610331664.git-patchwork-notify@kernel.org>
Date: Wed, 12 Jun 2024 02:30:31 +0000
References: <20240611113110.16955-1-tzungbi@kernel.org>
In-Reply-To: <20240611113110.16955-1-tzungbi@kernel.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev,
 stable@vger.kernel.org

Hello:

This patch was applied to chrome-platform/linux.git (for-next)
by Tzung-Bi Shih <tzungbi@kernel.org>:

On Tue, 11 Jun 2024 11:31:10 +0000 you wrote:
> ec_read_version_supported() uses ec_params_get_cmd_versions_v1 but it
> wrongly uses message version 0.
> 
> Fix it.
> 
> Cc: stable@vger.kernel.org
> Fixes: e86264595225 ("mfd: cros_ec: add debugfs, console log file")
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> 
> [...]

Here is the summary with links:
  - platform/chrome: cros_ec_debugfs: fix wrong EC message version
    https://git.kernel.org/chrome-platform/c/c2a28647bbb4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


