Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581224C6A
	for <chrome-platform@lists.linux.dev>; Mon, 20 Mar 2023 18:49:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99AAFC433EF;
	Mon, 20 Mar 2023 18:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679338159;
	bh=CZ1ZHhw3PAwUSr1RFLcjb3EwDHIuncqBo8djo22GoX0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=EYP4qmc6qfu6EjAznMtGQhzvJWIyu3VfimKLlctzdcfkx90GWy1byGmGknYl4Wy5g
	 f+OLUhEcWq38tykmJqJIVnJz28QPzTaDnJ6XIYxqlkkp+9L2WfLHuAXUFWnBl5fsGx
	 vVlpIjPg+eps9cXh5RCYhPtsN+fzjAfxxyGhriaE+Agzrw6x5xDP+/cxv++/m3krAL
	 10jcJcCFpfXnnqwkt5hSPWszQX0vG7p+Eaw4x7M1nSqDFRZYaA6zPrTgxkQpLW1txu
	 Mnw2mcHnjmIvUVv9qyzJ9JAlzkduVPg+8OWsNvJv0HSL8W707B0ZYzsevQ0j3gwXua
	 oC8ObwL0L1waA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Support Opensource <support.opensource@diasemi.com>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Saravanan Sekar <sravanhome@gmail.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Florian Fainelli <f.fainelli@gmail.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Robert Marko <robert.marko@sartura.hr>, 
 Luka Perkov <luka.perkov@sartura.hr>, Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 chrome-platform@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, patches@opensource.cirrus.com
In-Reply-To: <20230317233616.3968003-1-robh@kernel.org>
References: <20230317233616.3968003-1-robh@kernel.org>
Subject: Re: [PATCH] regulator: dt-bindings: Drop unneeded quotes
Message-Id: <167933815234.201304.14593009652707828902.b4-ty@kernel.org>
Date: Mon, 20 Mar 2023 18:49:12 +0000
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bd1bf

On Fri, 17 Mar 2023 18:36:14 -0500, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: dt-bindings: Drop unneeded quotes
      commit: cff5c895137cb5c3d48811881f111b17c444e2d5

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

