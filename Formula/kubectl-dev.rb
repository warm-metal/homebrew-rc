class KubectlDev < Formula
  desc "Kubectl plugin to support devlopment activities in k8s clusters"
  homepage "https://github.com/warm-metal/kubectl-dev"
  url "https://github.com/warm-metal/kubectl-dev/archive/v0.1.1.tar.gz"
  sha256 "96131862e1271f6a19c57be726c57f5ff15e0a0d910ca402f3ebd959d7ae5585"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/warm-metal/kubectl-dev/releases/download/v0.1.1"
    cellar :any_skip_relocation
    sha256 "62bffb4e4715dc400c5cec26136fb8c5b2a7b0dcaa426fef066eb5cbc5ae11d2" => :big_sur
  end

  depends_on "go" => :build
  depends_on "kubectl"

  def install
    system "go", "build", *std_go_args,
      "-ldflags",
      "-X github.com/warm-metal/kubectl-dev/pkg/release.Version=v0.1.1"\
      " -X github.com/warm-metal/kubectl-dev/pkg/release.Commit=7c5bbb53df818244c2ab6866c09e41ddf6c469d7",
      "./cmd/dev"
  end

  test do
    system bin/"kubectl-dev", "version"
  end
end
